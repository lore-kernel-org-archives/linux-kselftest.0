Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D81C84D7
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211333; cv=none; b=hXVTy2gUNN8PJkxIr2xkaZvnw8A+dDCrtaFncLOxA6Ge328DJ8oyVCH6dNtjkrZrGgJSCzwOKuB6vr7Np7vFS2sPFzkaeyi+qtqAfNO1ClxxOZEx30cp+iYisrnfroZ/Pyc9ACGj8ZK+paqzL50FMkfZlJRO0myOHeeagLjtyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211333; c=relaxed/simple;
	bh=+3lgLeKyGoruCl5bCKhJ3T83Paha5+SBWFamsUnyxf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOKWyb75368/AI3baWqCe9CkKIBBp7i5+dJ7E7CSiUn+SJKUG+EI80RnenAdrvLo81skNtPi8p9Yr6GnjZSlmVEowTQcyuG3NMlaZOdn+FkURQpEwP9dnSEyXlRCfze/PWJ5YKto42rliNjlE0eweF/ewtpO7k9ESaywO2Sv6fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAC8yCSI; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAC8yCSI"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b4bff33ceaso876229eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790211330; x=1790816130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfxOZpGwcVSI/AA/FeGaBOP+LTq0nuPyB8Q6sUgl39Y=;
        b=RAC8yCSIs8pHIsurtJ8Y9VAoEzTjaKQFYiHerJU+V5l/gqtYzFnMfWcHgCawBMfQCv
         6YJJ2SLy49VuXvUDPu2uH31YAAhfPzFsZ/9G/i1yBOy/y6BKAJF3qZKD0fFMsinwMeKh
         tLJvVFpTZSDkh4LIGzgvHODZcv3nGXfgKo+KGbtNb27eqA7EyvGJbURVSLqSvqvjb5q2
         rILJHm0MACSsujgle3lBb9Av3FSgY8/M0gLisr8b9Rt4TKp/SsX/UeYDHAmX61GUpYEB
         kEbnUya7qpRQSVkE9XOVHTeHfSQ3Qp5zr2t+eLKR0nVsXf/zL9nJowIgBmzXwJVskIQI
         Hl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790211330; x=1790816130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfxOZpGwcVSI/AA/FeGaBOP+LTq0nuPyB8Q6sUgl39Y=;
        b=bwCb86BtHmT9WkzPMUxmxgUSJCGQvbPa1yqh+r5i1lvL+poV8Qc2VDfOg39GRwZRfJ
         9L7MOM2CMltg1YjX8ghuubHP+xwJUsdgYNEOavFSG/AVHRjGDArPgctoxdOGd+Z1CuY4
         tebEgMY1Jx86o6POV1YIYIgHIW8zoH+fY4T/iN6ILvfYiJ23W1Igse5LQVEyee1n0sXK
         xVZab3Q6SQhyRYQUI3Zl50uwHvEtMApFZRaHr/LBIhGDy2ZRElyfv1VRHERxLZnVHbrJ
         27usbW0zxC3wQRAyM2h5WPKsnIG69lsCtGcxBjd6FlmDthQwRB/FHH7e9pZgeOUdRzbL
         Q2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXEVitgQUF3cfzAWyMC0WjUPY+H/p3Cac1HvHd9xdStXvc3BinwUTRV+W5gaRg6LM2ySNnUP/IuguRPuQomWM=@vger.kernel.org
X-Gm-Message-State: AFuF++mGThyI4RWZy6Vq19sbzhxaoGFh/eoqGJeecR/k2jJglzQQzGAn
	U5IdpbiCYpoASy8ryHMtU6dYrJk0U+kWTKcZ3/iYuxH/s08Z5SM634ml
X-Gm-Gg: AYBFou2JnfFp+lm1xDa8pVYu+JI05M+Ghv2FS3jpcn71lEN62r8gKdDA8KLVGaFj/7C
	oUH+k20EKPFvY1xvOI52P/MznllTVq43DPzFUF0wmrt8prLJq2DlBHwKBHp2eUftaF4SVwYXzkr
	MjMxZo6Z8N0jPV1FPdw2tBuRpUjgD3aVhuntUZQJwGuzQBBWDXDGfdO0FIkrAp4k7+fMSJaJCjB
	d+DJccx/g5zMrKu0JDGfexqg7sgUaHfOkwEbpt1wGejGhG5MCQe9YKvxZJz56fJ5Oyh+K9MON61
	RS+JBnOd+tnBxvOZ1jKCIu2iK1AHEY7wn3SgBDpMjY9rxAP03jsnjMq8LZhVpYNIXMLZmNAZM6c
	o+9txkQbnrRjRkSUv/IMOIeSxU29ACtHLsK1DG/omg78LQXoRst0mRdc2MGEuasSXe4NSXAc6pY
	T5KU2DOuGvbhDCVc//JQWZY57bGOMjGUdYKY3IefIudtX8P64t2PAwGCzEy7PGDY8pJfTSskq/B
	WYY66j5o61hh8OGcegk
X-Received: by 2002:a4a:e906:0:b0:6d0:1fe7:1744 with SMTP id 006d021491bc7-6d441d73979mr913528eaf.83.1790211329662;
        Wed, 23 Sep 2026 17:55:29 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:56::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1e75a1sm859150fac.4.2026.09.23.17.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:55:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:55:23 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: sgarzare@redhat.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, stefanha@redhat.com,
	mst@redhat.com, jasowangio@gmail.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, shuah@kernel.org, rdunlap@infradead.org,
	donald.hunter@gmail.com, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com,
	sdf.kernel@gmail.com, bobbyeshleman@meta.com
Subject: Re: [PATCH net-next v2 6/6] selftests/vsock: test the netns assign
 privilege checks
Message-ID: <arR0+/7pGWSY+NrD@devvm29614.prn0.facebook.com>
References: <20260921-vsock-guest-ns-v2-6-693bd78fde9e@meta.com>
 <179019126776.2160803.16648507383433583043@kernel.org>
 <arRttf9k4yKahe4R@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arRttf9k4yKahe4R@devvm29614.prn0.facebook.com>

On Wed, Sep 23, 2026 at 05:24:21PM -0700, Bobby Eshleman wrote:
> On Wed, Sep 23, 2026 at 07:21:07PM +0000, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider.
> > 
> > Critical: 0 · High: 0 · Medium: 1 · Low: 1
> > 
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchwork
> > know by including "pw-bot: cr" as a separate line at the end of your reply
> > (one such reply per series is enough).
> > 
> > - [Medium] Both new selftests
> >   (`test_ns_guest_assign_g2h_netns_no_cap_net_admin_fails`,…
> > - [Low] The two new shared-VM tests omit the `vm_reset_g2h()` cleanup
> >   that every other ns_guest_assign_g2h_netns_* test in USE_SHARED_VM…
> > 
> > --
> > 
> > selftests/vsock: test the netns assign privilege checks
> > 
> > Adds two vmtest.sh cases that attempt VSOCK_CMD_DEV_NETNS_SET without
> > CAP_NET_ADMIN and from an unprivileged user namespace, and enables
> > CONFIG_USER_NS in the vsock selftest config.
> > 
> > > diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> > > index e94cc2fd90ccd..4f42bcdac3f6c 100755
> > > --- a/tools/testing/selftests/vsock/vmtest.sh
> > > +++ b/tools/testing/selftests/vsock/vmtest.sh
> > 
> > [ ... ]
> > 
> > > @@ -187,6 +195,8 @@ readonly TEST_DESCS=(
> > >  	ns_guest_assign_g2h_netns_host_connect_ok
> > >  	ns_guest_assign_g2h_netns_reset_on_ns_delete_ok
> > >  	ns_guest_assign_g2h_netns_old_conn_send_fails
> > > +	ns_guest_assign_g2h_netns_no_cap_net_admin_fails
> > > +	ns_guest_assign_g2h_netns_unpriv_user_ns_fails
> > >  )
> > >  readonly NS_MODES=("local" "global")
> > 
> > [Severity: Low]
> > Both new tests are added to USE_SHARED_VM but neither calls
> > vm_reset_g2h() on any exit path, unlike every other
> > ns_guest_assign_g2h_netns_* test in that list.
> > 
> > Should these follow the sibling pattern?  If the privilege check under
> > test is broken, the assign succeeds and the guest's single g2h device is
> > left owned by the transient namespace created by unshare, while the
> > harness moves on to the next test in the same VM.
> > 
> > The kernel does restore this by itself once that namespace is reaped:
> > 
> > net/vmw_vsock/af_vsock.c:vsock_g2h_net_reset() {
> > 	if (likely(rcu_access_pointer(vsock_g2h_net) != net))
> > 		return;
> > 
> > 	mutex_lock(&vsock_register_mutex);
> > 	if (rcu_access_pointer(vsock_g2h_net) == net)
> > 		rcu_assign_pointer(vsock_g2h_net, &init_net);
> > 	...
> > }
> > 
> > registered as .pre_exit in vsock_pernet_ops, and the next test's
> > vm_ns_assign_g2h() overwrites the pointer anyway.  The residual window is
> > the asynchronous teardown that ..._reset_on_ns_delete_ok already documents
> > ("the namespace itself is dismantled from a workqueue, so the device does
> > not come back the same instant").  Since the new tests are appended last
> > in TEST_NAMES and USE_SHARED_VM, a default run is unaffected; this only
> > shows up with selective or reordered invocation.
> 
> Yes, these tests should call it regardless. Relying on cleanup makes the
> pass/fail race-y.
> 
> > 
> > [ ... ]
> > 
> > > @@ -1832,6 +1842,48 @@ test_ns_guest_assign_g2h_netns_reset_on_ns_delete_ok() {
> > >  	return "${KSFT_PASS}"
> > >  }
> > >  
> > > +test_ns_guest_assign_g2h_netns_no_cap_net_admin_fails() {
> > > +	local cmd="unshare -n setpriv --bounding-set=-net_admin"
> > > +	local rc
> > > +
> > > +	vm_ssh "init_ns" -- "${cmd}" python3 /root/ynl/cli.py --no-schema \
> > > +		--spec /root/ynl/vsock.yaml --do dev-netns-set &>/dev/null
> > > +	rc=$?
> > > +
> > > +	if [[ "${rc}" -eq 0 ]]; then
> > > +		log_host "assign unexpectedly succeeded without CAP_NET_ADMIN"
> > > +		return "${KSFT_FAIL}"
> > > +	fi
> > > +
> > > +	return "${KSFT_PASS}"
> > > +}
> > 
> > [Severity: Medium]
> > Can this test pass without the capability check ever being reached?  The
> > only assertion is rc -eq 0 => FAIL, output is discarded with &>/dev/null,
> > and there is no positive control, so any nonzero status reads as
> > KSFT_PASS.
> > 
> > A few concrete sources of a nonzero status that are not -EPERM:
> > 
> > net/vmw_vsock/af_vsock.c:vsock_nl_dev_netns_set_doit() {
> > 	int err = vsock_g2h_net_assign(genl_info_net(info));
> > 
> > 	if (err == -ENODEV)
> > 		NL_SET_ERR_MSG(info->extack,
> > 			       "no guest-to-host transport is loaded");
> > 	else if (err == -EOPNOTSUPP)
> > 	...
> > }
> > 
> > and cli.py collapses all of those to the same status as -EPERM:
> > 
> > tools/net/ynl/pyynl/cli.py:main() {
> >     except NlError as e:
> >         print(e)
> >         sys.exit(1)
> > }
> > 
> > vm_ssh() also returns ssh's own status, so a transport failure (255) or a
> > remote shell failure (127, e.g. an installed util-linux that does not
> > accept setpriv --bounding-set=-net_admin) is indistinguishable from the
> > expected refusal.  A python-side failure such as a missing
> > /root/ynl/vsock.yaml exits 1 too.
> > 
> > Would it be worth asserting the privileged case succeeds first?  The file
> > already has the helper the sibling tests use as a precondition:
> > 
> > vm_ns_assign_g2h() {
> > 	local ns=$1
> > 	local nspid=$2
> > 
> > 	vm_ns_exec "${ns}" "${nspid}" "python3 /root/ynl/cli.py --no-schema \
> > 		--spec /root/ynl/vsock.yaml --do dev-netns-set"
> > }
> > 
> > On the changelog note "ynl's cli.py does not report the errno": is that
> > accurate?  NlError.__str__() in tools/net/ynl/pyynl/lib/ynl.py does:
> > 
> >         msg += os.strerror(self.error)
> > 
> > so the error string is printed and the test could match "Operation not
> > permitted" instead of sending everything to /dev/null.
> 
> I considered this but felt like grepping stderr/stdout is somewhat
> unnatural. My plan was to later propose that cli.py returns the err via
> exit code, and then update these tests.
> 
> First checking the privileged assign sounds like a reasonable middle
> ground to rule out the other error states.
> 
> > 
> > > +
> > > +test_ns_guest_assign_g2h_netns_unpriv_user_ns_fails() {
> > > +	local unpriv_uid=65534
> > > +	local unpriv
> > > +	local rc
> > > +
> > > +	unpriv="setpriv --reuid=${unpriv_uid} --regid=${unpriv_uid}"
> > > +	unpriv="${unpriv} --clear-groups"
> > > +
> > > +	if ! vm_ssh "init_ns" -- "${unpriv} unshare -U true"; then
> > > +		log_host "unprivileged user namespaces unavailable, skipping"
> > > +		return "${KSFT_SKIP}"
> > > +	fi
> > > +
> > > +	vm_ssh "init_ns" -- "${unpriv} unshare -Urn" \
> > > +		python3 /root/ynl/cli.py --no-schema \
> > > +		--spec /root/ynl/vsock.yaml --do dev-netns-set &>/dev/null
> > > +	rc=$?
> > > +
> > > +	if [[ "${rc}" -eq 0 ]]; then
> > > +		log_host "assign unexpectedly succeeded for unprivileged user"
> > > +		return "${KSFT_FAIL}"
> > > +	fi
> > > +
> > > +	return "${KSFT_PASS}"
> > > +}
> > 
> > [Severity: Medium]
> > Same rc != 0 => KSFT_PASS inference here, plus the availability probe is
> > not the command being measured:
> > 
> > 	probe:    ${unpriv} unshare -U true
> > 	measured: ${unpriv} unshare -Urn python3 /root/ynl/cli.py ...
> > 
> > If the extra -r/-n setup or the python startup under uid 65534 fails, the
> > result is KSFT_PASS rather than KSFT_SKIP or KSFT_FAIL, and the child user
> > namespace never actually holds CAP_NET_ADMIN, which is the condition the
> > commit message says is being tested:
> > 
> >     the other confirms that CAP_NET_ADMIN in an unprivileged user ns
> >     alone is insufficient.
> > 
> > Would checking the reported error string, or asserting the privileged
> > assign works in the same test, make these two cases fail if
> > GENL_ADMIN_PERM is ever dropped from VSOCK_CMD_DEV_NETNS_SET?
> 
> Yep, can follow the same approach as above.

pw-bot: cr
