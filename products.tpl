{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">
  <div class="cart-body xn-products-cate">
            <div class="xn-home-header xn-info-header">
              <div class="header-cont">
                <h2>
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h2>
                {if $productGroup.tagline}
                    <p>{$productGroup.tagline}</p>
                {/if}
              </div>
            </div>
            {if $errormessage}
                <div class="alert alert-danger">
                    {$errormessage}
                </div>
            {elseif !$productGroup}
                <div class="alert alert-info">
                    {lang key='orderForm.selectCategory'}
                </div>
            {/if}
            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}
            <div class="products xn-products" id="products">
              {foreach $products as $key => $product}
                <div class="xn-product-card product clearfix" id="product{$product@iteration}">
                  <div class="xn-product-card-top">
                    <span id="product{$product@iteration}-name" class="xn-product-name">{$product.name}</span>
                    <div class="product-xn-price product-pricing" id="product{$product@iteration}-price">
                        {if $product.bid}
                            {$LANG.bundledeal}
                            {if $product.displayprice}
                                <span class="price">{$product.displayprice}</span>
                            {/if}
                        {else}
                            <span class="price">{$product.pricing.minprice.price}</span>
                            {if $product.pricing.minprice.setupFee}
                                <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                            {/if}
                        {/if}
                    </div>
                  </div>
                  <div class="product-desc">
                      {if $product.featuresdesc}
                          <p id="product{$product@iteration}-description">
                              {$product.featuresdesc}
                          </p>
                      {/if}
                      <ul>
                          {foreach $product.features as $feature => $value}
                              <li id="product{$product@iteration}-feature{$value@iteration}">
                                  <span class="feature-value">{$value}</span>
                                  {$feature}
                              </li>
                          {/foreach}
                      </ul>
                  </div>
                  <a href="{$WEB_ROOT}/cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="product-card-btn" id="product{$product@iteration}-order-button">
                      <i class="fas fa-shopping-cart"></i>
                      {$LANG.ordernowbutton}
                  </a>
                </div>
              {/foreach}
            </div>
        </div>
</div>