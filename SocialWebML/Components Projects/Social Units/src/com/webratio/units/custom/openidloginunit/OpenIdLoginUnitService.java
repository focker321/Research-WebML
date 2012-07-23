package com.webratio.units.custom.openidloginunit;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Element;
import org.expressme.openid.Association;
import org.expressme.openid.Authentication;
import org.expressme.openid.Endpoint;
import org.expressme.openid.OpenIdException;
import org.expressme.openid.OpenIdManager;

import com.webratio.rtx.RTXConstants;
import com.webratio.rtx.RTXContentUnitService;
import com.webratio.rtx.RTXException;
import com.webratio.rtx.RTXManager;
import com.webratio.rtx.RTXOperationUnitService;
import com.webratio.rtx.beans.ExtendedOperationUnitBean;
import com.webratio.rtx.core.AbstractService;
import com.webratio.rtx.core.BeanHelper;


public class OpenIdLoginUnitService extends AbstractService implements RTXContentUnitService, RTXOperationUnitService{

	static final long ONE_HOUR = 3600000L;
	static final long TWO_HOUR = ONE_HOUR * 2L;
	static final String ATTR_MAC = "openid_mac";
	static final String ATTR_ALIAS = "openid_alias";
	String myResult="Hello World";
	private OpenIdManager manager;
	
	private OpenIdLoginUnitBean user; 
	
    public OpenIdLoginUnitService(String id, RTXManager mgr, Element descr) {
        super(id, mgr, descr);
        //init();
    }

    /**
     * Este método sera ejecutado cada vez que la página contenedora de la unidad sea cargada o recargada
     * para que sea invocado el outlink debe de ser de tipo automatico o de transporte y para que esta opción
     * en el combobox se active (hasta el momento) se debe trabajar con link dentro de la misma página
     */
	public Object computeParameterValue(String outputParamName, Map pageContext, Map sessionContext) throws RTXException {
		HttpServletRequest request = (HttpServletRequest) pageContext.get(RTXConstants.HTTP_SERVLET_REQUEST_KEY);
		HttpServletResponse response = (HttpServletResponse) pageContext.get(RTXConstants.HTTP_SERVLET_RESPONSE_KEY);
		myResult = request.getParameter( "ad" );
		myResult = request.getParameter( "user_id" );
		
		System.err.println(myResult);
		try {
			selectionOpenID(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Object unitBean = getUnitBean(pageContext, sessionContext);
		return BeanHelper.getBeanProperty(unitBean, outputParamName,
				this);
	}



	protected Object getUnitBean(Map localContext, Map sessionContext)
	throws RTXException {
		Object unitBean = localContext.get('_' + getId());
		
		String country = BeanHelper.asString(sessionContext.get("ad"));
		
		System.err.println(country);
		if (unitBean == null ||
				Boolean.TRUE.equals(localContext.get(RTXConstants.IN_OPERATION_KEY)))
		{
			unitBean = createUnitBean(localContext, sessionContext);
		}
		localContext.put('_' + getId(), unitBean);
		return unitBean;
	}

	private ExtendedOperationUnitBean createUnitBean(Map localContext,
			Map sessionContext)throws RTXException {
		ExtendedOperationUnitBean bean = new
		ExtendedOperationUnitBean();
		

		myResult = "Hello World!!";
		try {
			bean.put("myResult", myResult);
//			bean.put("firstname", user.getFirst_name());
//			bean.put("lastname", user.getLast_name());
//			bean.put("email", user.getEmail());
//			

			bean.setResultCode(RTXConstants.SUCCESS_CODE);

		} catch (Exception e) {
			logError("Error in excuting http method", e);
			bean.setResultCode(RTXConstants.ERROR_CODE);
		}
		return bean;
	}

	public Object execute(Map localContext, Map sessionContext) throws RTXException {
		HttpServletRequest request = (HttpServletRequest) localContext.get(RTXConstants.HTTP_SERVLET_REQUEST_KEY);
		HttpServletResponse response = (HttpServletResponse) localContext.get(RTXConstants.HTTP_SERVLET_RESPONSE_KEY);
		myResult = request.getParameter( "ad" );
		System.err.println(myResult);
		
		
		
		return getUnitBean(localContext, sessionContext);
	}

    public void dispose() {
        // TODO Auto-generated method stub
    }

    
    
    
    public void init() {
		manager = new OpenIdManager();
		
		//Las siguientes 2 URLs deben de modificarse para capturar  el dominio y la page web a donde iran
		manager.setRealm("http://localhost:8080");
		manager.setReturnTo("http://localhost:8080/WRTravelAgency/page1.do");
	}
    
	private void selectionOpenID(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String op = request.getParameter("op");
		if (op==null) {
			// check sign on result from Google or Yahoo:
			checkNonce(request.getParameter("openid.response_nonce"));
			// get authentication:
			byte[] mac_key = (byte[]) request.getSession().getAttribute(ATTR_MAC);
			String alias = (String) request.getSession().getAttribute(ATTR_ALIAS);
			Authentication authentication = manager.getAuthentication(request, mac_key, alias);
			response.setContentType("text/html; charset=UTF-8");
			showAuthentication(response.getWriter(), authentication);
			return;
		}
		if (op.equals("Google") || op.equals("Yahoo")) {
			// redirect to Google or Yahoo sign on page:
			Endpoint endpoint = manager.lookupEndpoint(op);
			Association association = manager.lookupAssociation(endpoint);
			request.getSession().setAttribute(ATTR_MAC, association.getRawMacKey());
			request.getSession().setAttribute(ATTR_ALIAS, endpoint.getAlias());
			String url = manager.getAuthenticationUrl(endpoint, association);
			response.sendRedirect(url);
		}
		else {
			throw new ServletException("Unsupported OP: " + op);
		}
	}

	void showAuthentication(PrintWriter pw, Authentication auth) {
		user = new OpenIdLoginUnitBean();
		user.setIdentity(auth.getIdentity());
		user.setEmail(auth.getEmail());
		user.setFull_name(auth.getFullname());
		user.setFirst_name(auth.getFirstname());
		user.setLast_name(auth.getLastname());
		user.setGender(auth.getGender());
		user.setLanguage(auth.getLanguage());
		
		pw.print("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>Test JOpenID</title></head><body><h1>You have successfully signed on!</h1>");
		pw.print("<p>Identity: " + auth.getIdentity() + "</p>");
		pw.print("<p>Email: " + auth.getEmail() + "</p>");
		pw.print("<p>Full name: " + auth.getFullname() + "</p>");
		pw.print("<p>First name: " + auth.getFirstname() + "</p>");
		pw.print("<p>Last name: " + auth.getLastname() + "</p>");
		pw.print("<p>Gender: " + auth.getGender() + "</p>");
		pw.print("<p>Language: " + auth.getLanguage() + "</p>");
		pw.print("</body></html>");
		pw.flush();
	}

	void checkNonce(String nonce) {
		// check response_nonce to prevent replay-attack:
		if (nonce==null || nonce.length()<20)
			throw new OpenIdException("Verify failed.");
		// make sure the time of server is correct:
		long nonceTime = getNonceTime(nonce);
		long diff = Math.abs(System.currentTimeMillis() - nonceTime);
		if (diff > ONE_HOUR)
			throw new OpenIdException("Bad nonce time.");
		if (isNonceExist(nonce))
			throw new OpenIdException("Verify nonce failed.");
		storeNonce(nonce, nonceTime + TWO_HOUR);
	}

	// simulate a database that store all nonce:
	private Set<String> nonceDb = new HashSet<String>();

	// check if nonce is exist in database:
	boolean isNonceExist(String nonce) {
		return nonceDb.contains(nonce);
	}

	// store nonce in database:
	void storeNonce(String nonce, long expires) {
		nonceDb.add(nonce);
	}

	long getNonceTime(String nonce) {
		try {
			return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ")
			.parse(nonce.substring(0, 19) + "+0000")
			.getTime();
		}
		catch(ParseException e) {
			throw new OpenIdException("Bad nonce time.");
		}
	}


}