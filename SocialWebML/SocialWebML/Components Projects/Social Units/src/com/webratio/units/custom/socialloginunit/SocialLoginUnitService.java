package com.webratio.units.custom.socialloginunit;
import java.util.Map;

//Bibliotecas usadas para la integraci\'on con WebRatio
import org.dom4j.Element;
import com.webratio.rtx.RTXConstants;
import com.webratio.rtx.RTXContentUnitService;
import com.webratio.rtx.RTXException;
import com.webratio.rtx.RTXManager;
import com.webratio.rtx.RTXOperationUnitService;
import com.webratio.rtx.beans.ExtendedOperationUnitBean;
import com.webratio.rtx.core.AbstractService;
import com.webratio.rtx.core.BeanHelper;
import com.webratio.rtx.core.DescriptorHelper;


public class SocialLoginUnitService extends AbstractService implements RTXContentUnitService, RTXOperationUnitService{
	String myResult="Hello World";
	String name="Santiago";
	String app_id="";

	// bean;
	
	public SocialLoginUnitService(String id, RTXManager mgr, Element descr) {
		super(id, mgr, descr);
		
		//Seleccionado el elemento que contiene el valor de la unidad actual
		Element currentUnit = descr.element("SocialLoginUnit");
		
		//Lectura de parametros estaticos
		try{
			app_id = DescriptorHelper.getAttribute(currentUnit, "app_id", true, this).toString();
		}
		catch(Exception e){}
	}
	

    public Object computeParameterValue(String outputParamName, Map pageContext, Map sessionContext) throws RTXException {

		
		SocialLoginUnitBean unitBean = getUnitBean(pageContext, sessionContext);
		
		return BeanHelper.getBeanProperty(unitBean, outputParamName,
				this);
    }

    public Object execute(Map localContext, Map sessionContext) throws RTXException {

    	SocialLoginUnitBean unitBean = (SocialLoginUnitBean)getUnitBean(localContext, sessionContext);
		if (unitBean == null) {
			return null;
		}

		return unitBean;
    }

    public void dispose() {
        // TODO Auto-generated method stub
    } 

	protected SocialLoginUnitBean getUnitBean(Map pageContext, Map sessionContext)
	throws RTXException {
//		HttpServletRequest request = (HttpServletRequest) pageContext.get(RTXConstants.HTTP_SERVLET_REQUEST_KEY);
//		HttpServletResponse response = (HttpServletResponse) pageContext.get(RTXConstants.HTTP_SERVLET_RESPONSE_KEY);
//		myResult = request.getParameter( "ad" );
		//myResult = request.getParameter( "user_id" );
		
		SocialLoginUnitBean unitBean = (SocialLoginUnitBean) pageContext
		.get('_' + getId());
		if (unitBean == null ||
				Boolean.TRUE.equals(pageContext.get(RTXConstants.IN_OPERATION_KEY)))
		{
			unitBean = (SocialLoginUnitBean) createUnitBean(pageContext, sessionContext);
		}
		
		//unitBean.setUID(app_id);
		unitBean.put("uid", app_id);
		
		
		
//		
//		String inputUID = pageContext.get(getId() + ".UID").toString();
//
//		unitBean.setUID(inputUID);
		
		pageContext.put('_' + getId(), unitBean);
		return unitBean;
	}
	 
	private ExtendedOperationUnitBean createUnitBean(Map pageContext,
			Map sessionContext)throws RTXException {
		
		SocialLoginUnitBean bean =  new SocialLoginUnitBean();
		//bean.setUID(app_id);

		myResult = "Hello World!!";
		try {
			bean.put("myResult", myResult);
			bean.put("uid", 1);
			//bean.put("name", name);
			
			bean.setResultCode(RTXConstants.SUCCESS_CODE);

		} catch (Exception e) {
			logError("Error in executing http method", e);
			bean.setResultCode(RTXConstants.ERROR_CODE);
		}
		return bean;
	}
	
}