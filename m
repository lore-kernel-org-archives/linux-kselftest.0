From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 8 Nov 2017 13:41:33 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] selftests: firmware: skip
 unsupported custom firmware fallback tests
In-Reply-To: <1510141660-31612-3-git-send-email-amit.pundir@linaro.org>
References: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
 <1510141660-31612-3-git-send-email-amit.pundir@linaro.org>
Message-ID: <20171108124133.GB23612@kroah.com>

On Wed, Nov 08, 2017 at 05:17:40PM +0530, Amit Pundir wrote:
> Ignore custom firmware loading and cancellation tests on older
> kernel releases, which do not support this feature.
> 
> Signed-off-by: Amit Pundir <amit.pundir at linaro.org>

Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
