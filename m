From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 31 May 2018 08:35:30 +0200
Subject: [PATCH] selftests: add test for USB over IP driver
In-Reply-To: <20180531030057.32442-1-shuah@kernel.org>
References: <20180531030057.32442-1-shuah@kernel.org>
Message-ID: <20180531063530.GB7744@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531063530.DHvyEuh7o4ZpK10-RyyYErkG6YVlm0GnE17uckq18fM@z>

On Wed, May 30, 2018@09:00:57PM -0600, Shuah Khan (Samsung OSG) wrote:
> Add test for USB over IP driver. This test runs several tests on a device
> specified in the -b <busid> argument and path to the usbip tools.
> 
> usbip_test.sh -b <busid> -p <usbip tools path>
> 
> e.g:
> cd tools/testing selftests/drivers/usb/usbip
> sudo ./usbip_test.sh -b 3-10.2 -p <yoursrctree>/tools/usb/usbip
> 
> This test should be run as root and user should build usbip tools before
> running the test.
> 
> The usbip test isn't included in the Kselftest run as it requires user to
> specify a device to run tests on.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

If you want to take this through your tree, that's fine with me:

	Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

Otherwise I will be glad to queue it up in mine, just let me know what
is easier for you.

Nice work, thanks.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
