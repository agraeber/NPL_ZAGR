interface ZIF_ARS_CDS_AGGR_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZARS_CDS_AGGR,
 CREATE_ZARS_CDS_AGGR           TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECD331B',
 DELETE_ZARS_CDS_AGGR           TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECDB31B',
 LOCK_ZARS_CDS_AGGR             TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECC731B',
 SAVE_ZARS_CDS_AGGR             TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECE331B',
 SET_SUM                        TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C226D8D42D7339',
 UNLOCK_ZARS_CDS_AGGR           TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECCB31B',
 UPDATE_ZARS_CDS_AGGR           TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECD731B',
 VALIDATE_ZARS_CDS_AGGR         TYPE /BOBF/ACT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECDF31B',
      END OF ZARS_CDS_AGGR,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZARS_CDS_AGGR,
        BEGIN OF LOCK_ZARS_CDS_AGGR,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF LOCK_ZARS_CDS_AGGR,
        BEGIN OF UNLOCK_ZARS_CDS_AGGR,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
        END OF UNLOCK_ZARS_CDS_AGGR,
      END OF ZARS_CDS_AGGR,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZARS_CDS_AGGR,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECF131B',
      END OF ZARS_CDS_AGGR,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZARS_CDS_AGGR,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECC531B',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECC131B',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECD131B',
      END OF ZARS_CDS_AGGR,
      BEGIN OF ZARS_CDS_AGGR_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECE931B',
      END OF ZARS_CDS_AGGR_LOCK,
      BEGIN OF ZARS_CDS_AGGR_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECE731B',
      END OF ZARS_CDS_AGGR_MESSAGE,
      BEGIN OF ZARS_CDS_AGGR_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECEB31B',
      END OF ZARS_CDS_AGGR_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZARS_CDS_AGGR,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZARS_CDS_AGGR,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '080027EA07AF1ED7B2C1F07B689EF31B' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZARS_CDS_AGGR' .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZARS_CDS_AGGR                  TYPE /BOBF/OBM_NODE_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECBB31B',
 ZARS_CDS_AGGR_LOCK             TYPE /BOBF/OBM_NODE_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECC331B',
 ZARS_CDS_AGGR_MESSAGE          TYPE /BOBF/OBM_NODE_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECBF31B',
 ZARS_CDS_AGGR_PROPERTY         TYPE /BOBF/OBM_NODE_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECCF31B',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZARS_CDS_AGGR,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  SO_ID                          TYPE STRING VALUE 'SO_ID',
  CREATED_BY                     TYPE STRING VALUE 'CREATED_BY',
  CREATED_AT                     TYPE STRING VALUE 'CREATED_AT',
  CHANGED_BY                     TYPE STRING VALUE 'CHANGED_BY',
  CHANGED_AT                     TYPE STRING VALUE 'CHANGED_AT',
  CREATED_BY_BP                  TYPE STRING VALUE 'CREATED_BY_BP',
  CHANGED_BY_BP                  TYPE STRING VALUE 'CHANGED_BY_BP',
  NOTE_GUID                      TYPE STRING VALUE 'NOTE_GUID',
  BUYER_GUID                     TYPE STRING VALUE 'BUYER_GUID',
  CURRENCY_CODE                  TYPE STRING VALUE 'CURRENCY_CODE',
  GROSS_AMOUNT                   TYPE STRING VALUE 'GROSS_AMOUNT',
  NET_AMOUNT                     TYPE STRING VALUE 'NET_AMOUNT',
  TAX_AMOUNT                     TYPE STRING VALUE 'TAX_AMOUNT',
  LIFECYCLE_STATUS               TYPE STRING VALUE 'LIFECYCLE_STATUS',
  BILLING_STATUS                 TYPE STRING VALUE 'BILLING_STATUS',
  DELIVERY_STATUS                TYPE STRING VALUE 'DELIVERY_STATUS',
  OP_ID                          TYPE STRING VALUE 'OP_ID',
  _DATAAGING                     TYPE STRING VALUE '_DATAAGING',
  DUMMY                          TYPE STRING VALUE 'DUMMY',
  OVERALL_STATUS                 TYPE STRING VALUE 'OVERALL_STATUS',
  BUY_CONTACT_GUID               TYPE STRING VALUE 'BUY_CONTACT_GUID',
  SHIP_TO_ADR_GUID               TYPE STRING VALUE 'SHIP_TO_ADR_GUID',
  BILL_TO_ADR_GUID               TYPE STRING VALUE 'BILL_TO_ADR_GUID',
  PAYMENT_METHOD                 TYPE STRING VALUE 'PAYMENT_METHOD',
  PAYMENT_TERMS                  TYPE STRING VALUE 'PAYMENT_TERMS',
      END OF ZARS_CDS_AGGR,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZARS_CDS_AGGR,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '080027EA07AF1ED7B2C1F09B6ECBD31B',
      END OF ZARS_CDS_AGGR,
    END OF SC_NODE_CATEGORY .
endinterface.
