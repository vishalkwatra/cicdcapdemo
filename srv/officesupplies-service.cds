using {officesupplies1.db as db} from '../db/schema';
using {sap.common} from '@sap/cds/common';

service OfficeSuppliesService {

    entity Suppliers @(odata.draft.enabled : true) as projection on db.Suppliers {
        *,
        products : redirected to Products
    };

    entity Products                                as projection on db.Products {
        *,
        supplier : redirected to Suppliers
    };

    entity Currencies                              as projection on common.Currencies;

}