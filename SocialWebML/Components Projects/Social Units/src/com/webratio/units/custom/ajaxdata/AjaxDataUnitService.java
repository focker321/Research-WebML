package com.webratio.units.custom.ajaxdata;
import java.util.Map;
import org.dom4j.Element;
import com.webratio.rtx.RTXContentUnitService;
import com.webratio.rtx.RTXException;
import com.webratio.rtx.RTXManager;
import com.webratio.rtx.RTXOperationUnitService;
import com.webratio.rtx.core.AbstractService;


public class AjaxDataUnitService extends AbstractService implements RTXContentUnitService, RTXOperationUnitService{

    public AjaxDataUnitService(String id, RTXManager mgr, Element descr) {
        super(id, mgr, descr);
        // TODO Auto-generated constructor stub
    }

    public Object computeParameterValue(String outputParamName, Map pageContext, Map sessionContext) throws RTXException {
        // TODO Auto-generated method stub
        return null;
    }

    public Object execute(Map pageContext, Map sessionContext) throws RTXException {
        // TODO Auto-generated method stub

        return null;
    }



	public void dispose() {
        // TODO Auto-generated method stub
    }

}