Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557428030E
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 01:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312745; cv=none; b=Yb/r40KkIaLzv8eOrLgZ9x4HTtOpi7tC1d/JUZpH8tlMZH16cJgfrqI2WSF/SRvc0+YaGjdYFGnbgztESO6vSBZDWq/iduuV2zHJ95WQbFPTyp8aNKb+Ts8e/ogPwd94aDLegY82xfzhF4hpKWPAuLXB5yfthMXWR8DA47cjO+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312745; c=relaxed/simple;
	bh=xr2waKu/aOUVGC/LzBTXf6pBIZkaxBB75MdukW+kuyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+Rsu91wDZQEyyCwwwVXu3jpKcfzAl42DETm71vv4YJqwrCbySba0Kx72vp3CiQdiHlZiIrwd8gH0YLw5ftkkNTUtlOvIdBfKqeJ683rcPbaXy+nkHOhD2z5javSg9HF4XkM8XdchgdkyIBSIM/2oglFarYFapEuq2W91SwO27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cbRGl5hP; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cbRGl5hP"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xr2waKu/aOUVGC/LzBTXf6pBIZkaxBB75MdukW+kuyY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788312741; v=1; x=1788917541;
 b=cbRGl5hPa7AXBZEpiO7V8Hmc92tDKpOIGmKJaYLFk5yvYEMNENqyOaCavtTa1IA4uXyK/qhP
 MS+bIXx3+v/n20B5qDmgX6sY7MrL5lZWWyZQ6JJJxSmsbpRVP8GI0i2sD7Grn2Qrywsj5WDNTBO
 ieR+hOqmaZt461Vgkg0dMPh0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bab200725cdee734;
	Wed, 02 Sep 2026 01:32:21 +0000
X-Mizu-Trace-ID: bab200725cdee734
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 09:32:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Qianheng Peng <pengqh1@chinatelecom.cn>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, liuhangbin@gmail.com, rbm@suse.com,
	shuah@kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding
 kselftest_cmd_args with empty variable
Message-ID: <apd8mqEoyk8_O8ar@fedora>
References: <apae5q5R546M6283@fedora>
 <20260901120722.1875597-1-pengqh1@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901120722.1875597-1-pengqh1@chinatelecom.cn>

On Tue, Sep 01, 2026 at 08:07:22PM +0800, Qianheng Peng wrote:
> Hi Hangbin,
> On Tue, 1 Sep 2026 17:46:14, Hangbin Liu wrote:
> >Hi Qianheng
> >On Tue, Sep 01, 2026 at 10:44:52AM +0800, Qianheng Peng wrote:
> >> On Tue, 14 Jul 2026 14:34:43, Qianheng Peng wrote:
> >> >Normally the value of kselftest_cmd_args can be read from settings file,
> >> >but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
> >> >empty if user did not give it a real value.So it should be better to
> >> >check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
> >> >value to kselftest_cmd_args.
> >
> >Where does KSELFTEST_TEST_KMOD_SH_ARGS from? kmod testing? If yes,
> >can we fix it there?
> 
> Sorry for my confusing commit message and poor English.
> In fact the problem is not KSELFTEST_TEST_KMOD_SH_ARGS but empty
> kselftest_cmd_args_ref.
> If user does not export "KSELFTEST_${BASENAME_SANITIZED}_ARGS" (the
> ${BASENAME_SANITIZED} here can be anything like KMOD or RTCTEST) explicitly,
> kselftest_cmd_args_ref will be empty by default and override kselftest_cmd_args.
> So this patch will check whether kselftest_cmd_args_ref is empty before
> starting one test.

Oh, I see what you mean now.

	kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"

This is used to retrieve parameters for a *specific* test. When a test does not
require extra parameters, `KSELFTEST_${BASENAME_SANITIZED}_ARGS` is not set.
This has the same effect as when a user exports it but does not assign a value.

Therefore, I do not think we need to add a check for this case. Users should
understand the semantics when exporting the `KSELFTEST_${BASENAME_SANITIZED}_ARGS`
variable.

Thanks
Hangbin
