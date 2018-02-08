From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Thu, 8 Feb 2018 10:51:48 +0300
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Remove 5lvl
	test from Makefile
In-Reply-To: <1518069029-22457-1-git-send-email-daniel.diaz@linaro.org>
References: <1518069029-22457-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <20180208075148.gpxuve4cwwcp2etb@node.shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180208075148.OJGw7uRk9t-KHvfefKZnYzsdrSdBe9e2ak6Qzxk9Xa8@z>

On Wed, Feb 07, 2018@11:50:28PM -0600, Daniel Díaz wrote:
> The 5lvl.c test file was incorporated into another one in
> selftests/vm (va_128TBswitch.c) in commit 235266b8.
> 
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>

Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

-- 
 Kirill A. Shutemov
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
