From: skhan at linuxfoundation.org (Shuah Khan)
Date: Mon, 6 May 2019 08:47:15 -0600
Subject: [PATCH] selftests: add sleep between detach and usbip list -l
In-Reply-To: <20190505091356.GB25646@kroah.com>
References: <20190502194740.15344-1-skhan@linuxfoundation.org>
 <20190505091356.GB25646@kroah.com>
Message-ID: <ed0a3115-ee5a-97b6-b69c-073c9595d734@linuxfoundation.org>

On 5/5/19 3:13 AM, Greg KH wrote:
> On Thu, May 02, 2019 at 01:47:40PM -0600, Shuah Khan wrote:
>> Add a sleep between detach and check for exportable devices to avoid
>> the following segfault from libc-2.27.so
>>
>> [ 6268.136108] usbip[5565]: segfault at 0 ip 00007f2a947bddfd sp 00007ffd1a8705e8 error 4 in libc-2.27.so[7f2a94703000+1e7000]
>>
>> Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
>> ---
>>   tools/testing/selftests/drivers/usb/usbip/usbip_test.sh | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
>> index 128f0ab24307..beacf24a8df7 100755
>> --- a/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
>> +++ b/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
>> @@ -171,10 +171,14 @@ echo "Detach invalid port tests - expect invalid port error message";
>>   src/usbip detach -p 100;
>>   echo "=============================================================="
>>   
>> +# let detach complete. Avoid segfaults from libc-2.27.so
>> +sleep 3;
> 
> That feels very "arbitrary", why do we "know" it will take at most 3
> seconds?  I guess there's not much else we can do here except maybe
> somehow watch sysfs until the device is really gone?
> 

Yeah. Number 3 is somewhat arbitrary. It helps the host process the
detach request from the client and update the sysfs. Detach returns
as soon as client side is done, and the test is running the next
command on the host side. If I were run these commands manually, it
gives enough settling time. I am looking for a quick way to allow
settling time in this automated test.


thanks,
-- Shuah
