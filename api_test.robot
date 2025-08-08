*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://petstore.swagger.io/v2
${USER_ID}     20250808001
${USERNAME}    Suphittt

*** Test Cases ***
Test Cases 002
    [Documentation]    ทดสอบการสร้าง user ใหม่และตรวจสอบ response
    [Tags]             API

    # 1. สร้าง Dictionary สำหรับข้อมูลผู้ใช้
    &{user_data}=    Create Dictionary
    ...    id=${USER_ID}
    ...    username=${USERNAME}
    ...    firstName=Suphitcha
    ...    lastName=Thanakhamma
    ...    email=ssufortest@gmail.com
    ...    password=testerssu123
    ...    phone=0612345678
    ...    userStatus=1

    # 2. สร้าง Dictionary สำหรับ Headers
    &{request_headers}=    Create Dictionary    Content-Type=application/json

    # 3. สร้าง Session เพื่อใช้ส่ง Request
    Create Session    petstore_session    ${BASE_URL}

    # 4. ส่ง POST Request ไปยัง /user endpoint
    ${response}=    POST On Session
    ...    alias=petstore_session
    ...    url=/user
    ...    json=${user_data}
    ...    headers=&{request_headers}

    # 5. ตรวจสอบผลลัพธ์
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}=    Set Variable    ${response.json()}
    ${message}=           Get From Dictionary    ${response_body}    message
    Should Be Equal As Strings    ${message}    ${USER_ID}