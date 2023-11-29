
# Airbyte Shopify dbt Package

## What Does This dbt Package Do?

This dbt package models Shopify data created by [Airbyte's Shopify connector](https://airbyte.com/connectors/shopify). It transforms the core tables into analytics-ready models.

The below table lists all of the models materialised by this package and a brief description of each.

| Model                     | Description          |
|---------------------------|----------------------|
| shopify__customers        | Each record represents on customer on Shopify. This model includes a customer's lifetime value, number of orders, and when they first and last purchased. |
| shopify__order_line_items | Each record represents a purchased product variant. This model references the quantity purchased, and the product variant's base and presentment price. |
| shopify__orders           | Each record represents an order on Shopify. This model includes order shipping information, as well as product prices in base and presentment currencies. |
| shopify__product_variants | Each record represents a unique product variant on Shopify. |
| shopify__products         | Each record represents a unique product on Shopify. This model totals the sold quantity of a given product, and details when a product was first and last purchased. |
| shopify__refunds          | Each record represents a refund on Shopify. |

## How Do I Install This Package?

Include the following in your packages.yml file:

```
packages:
  - git: "https://github.com/creativeautomation/dbt-airbyte-shopify.git"  
    revision: 0.1.1
```

Run `dbt deps` to install the package.

## Define Database and Schema Variables

By default, this package runs using your destination and the airbyte schema. If this is not where your Airbyte data is stored, add the following configuration to your root dbt_project.yml file:

```
vars:
    shopify_database: your_database_name
    shopify_schema: your_schema_name
```

## Notes

This package has been tested in Google BigQuery only.