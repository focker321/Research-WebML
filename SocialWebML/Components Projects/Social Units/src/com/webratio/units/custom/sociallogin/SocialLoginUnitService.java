package com.webratio.units.custom.sociallogin;
import java.util.Map;

import org.dom4j.Element;

import com.webratio.rtx.RTXConstants;
import com.webratio.rtx.RTXContentUnitService;
import com.webratio.rtx.RTXException;
import com.webratio.rtx.RTXManager;
import com.webratio.rtx.core.AbstractService;
import com.webratio.rtx.core.DescriptorHelper;


public class SocialLoginUnitService extends AbstractService implements RTXContentUnitService{

	String app_id="";
	public SocialLoginUnitService(String id, RTXManager mgr, Element descr) {
		super(id, mgr, descr);
		
		//Seleccionado el elemento que contiene el valor de la unidad actual
		Element currentUnit = descr.element("SocialLogin");
		
		//Lectura de parametros estaticos
		try{
			app_id = DescriptorHelper.getAttribute(currentUnit, "app_id", true, this).toString();
		}
		catch(Exception e){}
	}

	public Object computeParameterValue(String outputParamName, Map pageContext, Map sessionContext) throws RTXException {
		return null;
	}

	public Object execute(Map pageContext, Map sessionContext) throws RTXException {
		SocialLoginUnitBean bean = new SocialLoginUnitBean();
			bean.setUID(app_id);
			
		return bean;
	}

	public void dispose() {
		// TODO Auto-generated method stub
	}
}