Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8737F006
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035164; cv=none; b=V93FwBcNoiWNybBDp3UNzmUVmWh8/0JzUc+wJvsBd8GkVpr8CWo+AKBPcXK1qiV/ZK6evvbkXLJxZcf7xN2mUpCvHv9dKUQtx44EuMot/FtHBDhSPD45tZ+yg34ZBOkXd3RlN7KGLS3WyWVNqdOURWq2H8Ykox4agA1TI3M89y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035164; c=relaxed/simple;
	bh=dQ5IqWXInSaymnKoUprsQiUVNQqoZGGIyvBT8SOLEK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfrRVf1kcJWLrs3e/RZvS2nJAuuqKR55tNsZLWZpEv5hpPNPFA2TVLpjGSE8Fysc5cgeiHrNP0uckLMmp7M1l1Q0aS2xDK5UEfDW+nQUGd+tp/cK47JwL6O41D9B1EiIElPXvGRQU83GFYR4VsumtEDtC5YW6Ea8MCiAwMdIi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PbUDzh5x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PbUDzh5x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so28266885e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786035161; x=1786639961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d4I9PQegTf7uvTcUzJ5aZtvmy+ceJfUtecHFNwEPPck=;
        b=PbUDzh5xtWuY2N7zbmp7fGPBwuGEGQBfyRW+mjL1UQB6Xpqfzq4iTnb2VUenzylHau
         jqOhD6FExuEeLRUNd5qXk/kUjyk0t3Gh+vh7nbDEshSKN90T+n6arDwlY+yEH1czc5Lv
         fafDuiUBezVR+L9/brXncJPz4L1S3pehJDOAWfeAF1Em4fwpAcP+mFFF8DpIcGVYYbot
         eAbe+INTiqoS6PYieWw2llJQzO589LjfUeRdzBc7Fgg978mB1hwmbdpsFKb/mbyvZLDX
         1DNUPWiACq9DZul2wHigFuVIx0EO1nCzcXd2HCzy6TM2nhCIn7R10zD4422TWZuZmhZK
         sDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035161; x=1786639961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4I9PQegTf7uvTcUzJ5aZtvmy+ceJfUtecHFNwEPPck=;
        b=bzlwnR74HX2OR3buq/PQQsBTqXJF2G66Kf5h6m1HEh+3rL+5QMik10ezZPSLxw6wMy
         jheSr4/tMS3EtqCblJPrXRbf7w12s6Pl+P3faNK+2BYKzklBfryb+FVpvWgvsAlOGGWE
         99UeDbsZkl9pDUTgUByDb4cR6lvQC861Jlx2JQH6DyzgVxz5DHRtMNJj85QTZE7z/WVM
         5ySZXB+EWLTcplC9K7sa9qaL3USNewhcoV1pj0ehbCRXWvu3YxYpJP9hFnI29QDp0XJ6
         b3rDSdgcuV6jUxKzGo8b1+bIkjl1WkW39XtoqTeDtbUEQHF/gi528gXz+JsMCI+SOhJl
         N0hA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2gpc71dBHBaYffuJA/uM4RvpoCDP3QRWbSt91W8YdxrC5pdd0RTIdSIKU+5s7SdVsvGcF6nBvpiukcg5KkBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/keC3uVBDfZPB+4sBtzyCq3+A3hYKByBcNF2/3AK56hWnKssu
	Tg98Rpo/ujCm7r1ZNC8aw/ye2u1Atndue2Lv5LmZTo7uTliNY1XtZjhA+j4ROu2K7F/ilD/jaDl
	ATQ0ZKJAF3g==
X-Gm-Gg: AR+sD1132ORnSuGYAQms9z4ew83IYLQCn2FqixWbizXQo7S+YOP6F35BhsCm2sZ/mgW
	YBtiDSTwLmBM3CyoN1v0l2Y3HGKSDrGfzO1t6g1NLTXfOm2iFHtBBn4PMgaYiKapRp5heS3MXtB
	1HSNGhzYfmEZEuCMDklntJvfAQ9Mt/FlyaIi8wZewqTzHnyMcMzZ28rouaB5GBCxgSuGIfZqCe7
	/pxQuBQnECOTK1KM1/FNcgCucUFJX0ajGju13ot/FSYoTnczkUSLW6gHxq2iOu/2V7sX6D+gsrF
	aXn4wuK39TZgY9eUTJl8qR9RLuoFqUqZoNNpCxIgFEwtV378tbS2uOLg+7ia0A/kHFTSSlnEI+r
	C4o8YpPt9vT25/Xdr2Lc9T9Wvn8Dyvi3zkkg+jk2FUOanuvyQ0pcxL/OtNbgK75h/y4jZF4aVk3
	2pK7z6LilopPaTEYlSNx3vAfQNDvr7n18IF+2Y0xXObYDpzSBgR6IrhXBPca45wEw/
X-Received: by 2002:a05:600c:1c19:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-4995220db75mr153897755e9.16.1786035161179;
        Thu, 06 Aug 2026 09:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bb88b41sm1459465e9.0.2026.08.06.09.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:52:40 -0700 (PDT)
Date: Thu, 6 Aug 2026 18:52:38 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Suren Baghdasaryan <surenb@google.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Ziyang Men <ziyang.meme@gmail.com>, 
	Tao Cui <cuitao@kylinos.cn>
Subject: Re: [PATCH v2] selftests/cgroup: add PSI pressure trigger and
 validation tests
Message-ID: <anS3saMkFog89yxy@localhost.localdomain>
References: <20260728083742.2359320-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i442jnxidzyxfqpu"
Content-Disposition: inline
In-Reply-To: <20260728083742.2359320-1-cui.tao@linux.dev>


--i442jnxidzyxfqpu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2] selftests/cgroup: add PSI pressure trigger and
 validation tests
MIME-Version: 1.0

Hi,
thanks for continuing with this.

On Tue, Jul 28, 2026 at 04:37:42PM +0800, Tao Cui <cui.tao@linux.dev> wrote:
> +/* Trigger smoke test: second on same fd -> EBUSY; IRQ rejects "some". */
> +static int test_proc_triggers(const char *root)
> +{
> +	static const char *const resources[] = { "io", "memory", "cpu" };
> +	int ret = KSFT_FAIL;
> +	int fd = -1;
> +	int i;
> +
> +	(void)root;

WTH?

> +
> +	for (i = 0; i < (int)ARRAY_SIZE(resources); i++) {

This (int) cast is quite uncommon, look around.

> +/* Induce deterministic CPU pressure (more hogs than CPUs). */
> +static int test_cgroup_trigger_fire(const char *root)
> +{
> +	char *cg = NULL, *cpupress = NULL;
> +	int fd = -1, ret = KSFT_FAIL;
> +	struct pollfd pfd;
> +	long ncpus, i;
> +	pid_t pid;
> +
> +	cg = cg_name(root, "psi_trigger_test");
> +	if (!cg)
> +		goto cleanup;
> +	if (cg_create(cg))
> +		goto cleanup;
> +
> +	cpupress = cg_control(cg, "cpu.pressure");
> +	if (!cpupress)
> +		goto cleanup;
> +	fd = open(cpupress, O_RDWR);
> +	if (fd < 0) {
> +		ksft_print_msg("open cpu.pressure: %s\n", strerror(errno));
> +		goto cleanup;
> +	}
> +
> +	/* 1us threshold in a 1s window: any cpu stall fires it. */
> +	errno = 0;
> +	if (write_trigger(fd, "some 1 1000000") <= 0) {
> +		ksft_print_msg("arming trigger failed: %s\n", strerror(errno));
> +		goto cleanup;
> +	}

When I see this, could you increase the window size to 2000000 (so that
it has potential to run for unprivileged users)?

> +
> +	ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> +	if (ncpus <= 0)
> +		ncpus = 1;
> +
> +	pid = fork();
> +	if (pid < 0) {
> +		ksft_print_msg("fork: %s\n", strerror(errno));
> +		goto cleanup;
> +	}
> +	if (pid == 0) {
> +		/* Enter the cgroup, then over-subscribe it with CPU hogs. */
> +		if (cg_enter_current(cg))
> +			_exit(KSFT_FAIL);
> +		for (i = 0; i < ncpus; i++) {
> +			if (fork() == 0) {
> +				for (;;)
> +					asm volatile("" ::: "memory");
> +				_exit(0);
> +			}
> +		}
> +		for (;;)
> +			asm volatile("" ::: "memory");	/* child is also a hog */
> +		_exit(0);
> +	}

This part could be replaced with generalized hog_cpus_timed() from
test_cpu.c (after move to cgroup_util.c).

> +int main(int argc, char **argv)
> +{
> +	char root[PATH_MAX];
> +	int mempress_fd;
> +	int i;
> +
> +	(void)argc;

What's up with this?

> +
> +	ksft_print_header();
> +	ksft_set_plan(ARRAY_SIZE(tests));
> +
> +	if (cg_find_unified_root(root, sizeof(root), NULL))
> +		ksft_exit_skip("cgroup v2 isn't mounted\n");
> +
> +	/* PSI must be enabled (CONFIG_PSI=y, not default-disabled). */
> +	mempress_fd = open("/proc/pressure/memory", O_RDONLY);
> +	if (mempress_fd < 0)
> +		ksft_exit_skip("PSI unavailable (CONFIG_PSI=n or psi=0)\n");
> +	close(mempress_fd);
> +
> +	if (cg_read_strstr(root, "cgroup.controllers", "memory"))
> +		ksft_exit_skip("memory controller isn't available\n");
> +	if (cg_read_strstr(root, "cgroup.subtree_control", "memory"))
> +		if (cg_write(root, "cgroup.subtree_control", "+memory"))
> +			ksft_exit_skip("failed to enable memory controller\n");

The memory controller is unnecessary now, right?


Regards,
Michal

--i442jnxidzyxfqpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCanS70hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AglDwEAjNUq22hKhjzlVWfXu5cg
aPLt5PK2xHmi5dIQjnz1arMBAIX3oTSzm5ArJ9Uq31Khf/cHEsiW33LIq/VRw/l7
s0AO
=uRN1
-----END PGP SIGNATURE-----

--i442jnxidzyxfqpu--
