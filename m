From: mcgrof@kernel.org (Luis R. Rodriguez)
Date: Wed, 8 Nov 2017 17:49:01 +0100
Subject: [Linux-kselftest-mirror] [PATCH 0/2] selftests: firmware: skip
 testing unsupported features
In-Reply-To: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
References: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
Message-ID: <20171108164901.GN22894@wotan.suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171108164901.25hTEWo7riW95F43ioeWHJanjcdUIdOq4A7OT5UoTpg@z>

On Wed, Nov 08, 2017@05:17:38PM +0530, Amit Pundir wrote:
> Hi,
> 
> At Linaro we run mainline/linux-next selftests on LTS releases and
> run into few test failures due to kernel mismatch or missing upstream
> functionality in older kernels. Discussed at length here:
> https://lkml.org/lkml/2017/6/15/652
> 
> This patch series is an attempt to modify selftest firmware test scripts.
> The proposed changes skip/ignore testing the upstream functionality
> missing in the older kernel releases.
> 
> Regards,
> Amit Pundir
> 
> 
> Amit Pundir (2):
>   selftests: firmware: skip unsupported async loading tests
>   selftests: firmware: skip unsupported custom firmware fallback tests

For both, if you re-send with a Fixes tag that would be appreciated, there
is tooling now in place so that when a Fixes tag is used maintainers in
a distro kernel merge these patches as well when relevant. If you can
resend with that tag, or if Shuah is willing to amend the commit log
with them if you provide it:

Acked-by: Luis R. Rodriguez <mcgrof at kernel.org>

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
