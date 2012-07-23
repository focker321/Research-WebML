package com.webratio.units.custom.getsocialdataunit;
import java.util.Map;
//Biblioteca para poder extraer la sesi\'on como un objeto y poder trabajar con este
import javax.servlet.http.HttpServletRequest;

//Biblioteca para poder desencriptar los parametros traids desde la parte cliente
import org.apache.commons.codec.binary.Base64;

//Bibliotecas usadas para la integraci\'on con WebRatio
import org.dom4j.Element;
import com.webratio.rtx.RTXConstants;
import com.webratio.rtx.RTXContentUnitService;
import com.webratio.rtx.RTXException;
import com.webratio.rtx.RTXManager;
import com.webratio.rtx.core.AbstractService;
import com.webratio.rtx.core.BeanHelper;


public class GetSocialDataUnitService extends AbstractService implements RTXContentUnitService{
	private String uid_social_network;
	private String name_social_network;

	public GetSocialDataUnitService(String id, RTXManager mgr, Element descr) throws RTXException {
		super(id, mgr, descr);
	}

	public Object computeParameterValue(String outputParamName, Map pageContext, Map sessionContext) throws RTXException {
		//Para enviar los parametros de sesi\'on para el link de output
		GetSocialDataUnitBean unitBean = getUnitBean(pageContext, sessionContext);
		return BeanHelper.getBeanProperty(unitBean, outputParamName,
				this);
	}

	public Object execute(Map pageContext, Map sessionContext) throws RTXException {
		GetSocialDataUnitBean unitBean = getUnitBean(pageContext, sessionContext);
		if (unitBean == null) {
			return null;
		}
		return unitBean;
	}

	public void dispose() {
		// TODO Auto-generated method stub
	}

	@SuppressWarnings("unchecked")
	protected GetSocialDataUnitBean getUnitBean(Map pageContext, Map sessionContext)
	throws RTXException {
		//Extracci\'on de la sesi\'on
		HttpServletRequest request = (HttpServletRequest) pageContext.get(RTXConstants.HTTP_SERVLET_REQUEST_KEY);
		
		//Extracci\'on de parametros de la sesi\'on y encriptaci\'on
		uid_social_network = request.getParameter( "slu_uid" );
		name_social_network = request.getParameter( "slu_n" );
		try{
			uid_social_network = new String(Base64.decodeBase64(uid_social_network));
			name_social_network = new String(Base64.decodeBase64(name_social_network));
		}catch(Exception e){}	

		GetSocialDataUnitBean unitBean = (GetSocialDataUnitBean) pageContext.get('_' + getId());
		if (unitBean == null) {
			unitBean = new GetSocialDataUnitBean();

			//Inserci\'on de datos a la sesi\'on
			try {
				unitBean.put("name", name_social_network);
				unitBean.put("uid", uid_social_network);
				unitBean.setResultCode(RTXConstants.SUCCESS_CODE);

			} catch (Exception e) {
				logError("Error in executing http method", e);
				unitBean.setResultCode(RTXConstants.ERROR_CODE);
			}


		}
		pageContext.put('_' + getId(), unitBean);

		return unitBean;
	}
}
