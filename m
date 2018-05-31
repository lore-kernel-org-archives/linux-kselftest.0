From: shuah at kernel.org (Shuah Khan)
Date: Thu, 31 May 2018 08:42:33 -0600
Subject: [PATCH] selftests: add test for USB over IP driver
In-Reply-To: <20180531063530.GB7744@kroah.com>
References: <20180531030057.32442-1-shuah@kernel.org>
 <20180531063530.GB7744@kroah.com>
Message-ID: <52c33b15-0bc3-83ab-1e9c-bef7a0cbf791@kernel.org>

On 05/31/2018 12:35 AM, Greg KH wrote:
> On Wed, May 30, 2018 at 09:00:57PM -0600, Shuah Khan (Samsung OSG) wrote:
>> Add test for USB over IP driver. This test runs several tests on a device
>> specified in the -b <busid> argument and path to the usbip tools.
>>
>> usbip_test.sh -b <busid> -p <usbip tools path>
>>
>> e.g:
>> cd tools/testing selftests/drivers/usb/usbip
>> sudo ./usbip_test.sh -b 3-10.2 -p <yoursrctree>/tools/usb/usbip
>>
>> This test should be run as root and user should build usbip tools before
>> running the test.
>>
>> The usbip test isn't included in the Kselftest run as it requires user to
>> specify a device to run tests on.
>>
>> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> 
> If you want to take this through your tree, that's fine with me:
> 
> 	Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> 
> Otherwise I will be glad to queue it up in mine, just let me know what
> is easier for you.
> 
> Nice work, thanks.

Thanks. Please take this through your tree sticking to the current flow
of patches for this driver.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
