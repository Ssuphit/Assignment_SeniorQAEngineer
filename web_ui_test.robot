*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${PRODUCT_NAME}   Sauce Labs Backpack
${PRODUCT_PRICE}  $29.99

*** Test Cases ***
Test Cases 001
    [Documentation]    ทดสอบการล็อกอิน, เพิ่มสินค้าลงตะกร้า, และตรวจสอบความถูกต้องของสินค้าในตะกร้า
    [Tags]             Web UI

    เปิดหน้าเว็บ SauceDemo
    ใส่ชื่อผู้ใช้งาน
    ใส่รหัสผ่าน
    กดปุ่ม Login
    ตรวจสอบชื่อสินค้าที่หน้าหลัก
    ตรวจสอบราคาสินค้าที่หน้าหลัก
    กดปุ่ม Add to cart
    ตรวจสอบว่าปุ่มเปลี่ยนเป็น Remove
    กดปุ่ม ตะกร้าสินค้า
    ตรวจสอบชื่อสินค้าในหน้าตะกร้า
    ตรวจสอบราคาสินค้าในหน้าตะกร้า
    ตรวจสอบจำนวนสินค้าในหน้าตะกร้า

    [Teardown]    Close Browser

*** Keywords ***
เปิดหน้าเว็บ SauceDemo
    [Documentation]    ขั้นตอนที่ 1: เข้าหน้าแรกของที่ https://www.saucedemo.com/
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

ใส่ชื่อผู้ใช้งาน
    [Documentation]    ขั้นตอนที่ 2: ใส่ Username: standard_user
    Wait Until Page Contains Element    id:user-name
    Input Text      id:user-name       ${USERNAME}

ใส่รหัสผ่าน
    [Documentation]    ขั้นตอนที่ 3: ใส่ Password: secret_sauce
    Input Text      id:password       ${PASSWORD}

กดปุ่ม Login
    [Documentation]    ขั้นตอนที่ 4: กดปุ่ม Login เข้าสู่ระบบ
    Click Button    id:login-button
    Wait Until Page Contains Element    id:inventory_container

ตรวจสอบชื่อสินค้าที่หน้าหลัก
    [Documentation]    ขั้นตอนที่ 5: ตรวจสอบชื่อสินค้า Sauce Labs Backpack
    ${name_on_page}=    Get Text    xpath=//div[text()='${PRODUCT_NAME}']
    Should Be Equal As Strings    ${name_on_page}    ${PRODUCT_NAME}

ตรวจสอบราคาสินค้าที่หน้าหลัก
    [Documentation]    ขั้นตอนที่ 6: ตรวจสอบราคาสินค้า Sauce Labs Backpack
    ${price_on_page}=   Get Text    xpath=//div[text()='${PRODUCT_NAME}']/ancestor::div[@class='inventory_item_description']//div[@class='inventory_item_price']
    Should Be Equal As Strings    ${price_on_page}    ${PRODUCT_PRICE}

กดปุ่ม Add to cart
    [Documentation]    ขั้นตอนที่ 7: กดปุ่ม Add to cart
    Click Button    id:add-to-cart-sauce-labs-backpack

ตรวจสอบว่าปุ่มเปลี่ยนเป็น Remove
    [Documentation]    ขั้นตอนที่ 8: ตรวจสอบการเพิ่มสินค้าเข้าตระกร้าสินค้าสำเร็จ
    Element Should Contain    id:remove-sauce-labs-backpack    Remove

กดปุ่ม ตะกร้าสินค้า
    [Documentation]    ขั้นตอนที่ 9: กดปุ่ม Cart เข้าไปที่ตระกร้าสินค้า
    Click Element    class:shopping_cart_link
    Wait Until Page Contains Element    class:cart_item

ตรวจสอบชื่อสินค้าในหน้าตะกร้า
    [Documentation]    ขั้นตอนที่ 10: ตรวจสอบชื่อสินค้า ที่ หน้าตระกร้าสินค้า
    ${name_in_cart}=    Get Text    class:inventory_item_name
    Should Be Equal As Strings    ${name_in_cart}    ${PRODUCT_NAME}

ตรวจสอบราคาสินค้าในหน้าตะกร้า
    [Documentation]    ขั้นตอนที่ 11: ตรวจสอบราคาสินค้า ที่ หน้าตระกร้าสินค้า
    ${price_in_cart}=   Get Text    class:inventory_item_price
    Should Be Equal As Strings    ${price_in_cart}    ${PRODUCT_PRICE}

ตรวจสอบจำนวนสินค้าในหน้าตะกร้า
    [Documentation]    ขั้นตอนที่ 12: ตรวจสอบจำนวนสินค้า ที่ หน้าตระกร้าสินค้า
    ${quantity_in_cart}=    Get Text    class:cart_quantity
    Should Be Equal As Strings    ${quantity_in_cart}    1