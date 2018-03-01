From: idosch at idosch.org (Ido Schimmel)
Date: Thu, 1 Mar 2018 21:36:18 +0200
Subject: [PATCH net-next 2/5] selftests: forwarding: Only check for mz
 when it is needed
In-Reply-To: <20180301190947.7299-3-dsahern@gmail.com>
References: <20180301190947.7299-1-dsahern@gmail.com>
 <20180301190947.7299-3-dsahern@gmail.com>
Message-ID: <20180301193618.GB4839@splinter>

On Thu, Mar 01, 2018 at 11:09:44AM -0800, David Ahern wrote:
> Add a CHECK_MZ flag and only check if mz exists when flag is set.
> If it does not exist, exit non-0.
> 
> Signed-off-by: David Ahern <dsahern at gmail.com>

The only test that doesn't require it is router.sh so I'm not sure it's
worth the effort. If you still want to keep the patch then
bridge_vlan_aware.sh needs to be patched as well.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
