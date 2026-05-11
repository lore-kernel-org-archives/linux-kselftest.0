Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FAA3A1CE6
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504876; cv=none; b=PNPmfKbvzz3G5Qy3wgWlXv8MRdgb3cER/kWxzh9t0qMdRcod3cGP/7UwnHCOvonqkQqeJ3T1DjjRoRehDQGu0eyvyS8dBJq1y3h1HrLXl8rAVygliy75okrTxzZKUOYM4Y2Nai4AXaCnRmmUNLQ3h5uPkLfFGoYdmb068WHHgG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504876; c=relaxed/simple;
	bh=Ve14qOZB6IijyDTsiUWPeGOsSOLkx/bw4m6bBMVawZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn2PWCLUUQKixiOcGdNo+f48yF9ObcfME49HNMM//XTTUwOhnig0GqbfLSQgJLEnwc2woTekPVrtrj5ANDWkiXg3shoOUf6AFOScNCCgYobfJQJjMWFyAicX7EZB5+Q++Z4rQeBQp2sAPVn+g6cNWvm2QA38nWARhTRd7vKp9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sgx4Hd7t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sgx4Hd7t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so46298395e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778504873; x=1779109673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dy6auEdvCgEB/rpn78rKFNSXFt4boyLgJAQZRyoszRY=;
        b=Sgx4Hd7t/RaHjeot9to0FZJbg69DzCtbk3E4JQijbOL6WRKzProjRkyTJvxfdyLrA0
         MNndxcNIIvFHpnVEdiGykqkcLf4TUrFD8D6haDgQVgTvcuJM2EZE6FvVSI/OKrpCFeoP
         fkvdfGJmgR/xakZVyXfJ9D3ujIqir2k9ATayT2ATTHzm/42Q/glhPo5Yok0k0N3tYz4T
         jnPnB0Z0Ro1JhL8Ho0lmTpMa6hrpKv1XN0CCIddQv335vKPmDYtx97yMt5PYuniTRns3
         C//lwPmsm9N5RcBi5PXTso/FhhwcvrJa+eOZAvT6N9TdHl4qEOg+IgNV500RroAz4EIS
         n1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504873; x=1779109673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy6auEdvCgEB/rpn78rKFNSXFt4boyLgJAQZRyoszRY=;
        b=A+7zvbZLA5r1h6aa1cCqyfVrFR/ru/8dcwThmmqObSLcSq9Amo4HgkiVQ4x6wjytXk
         /3lVmC6e/h6HJzPtg2YGaKww9qU+HfaLt6Ts7MDnWduJ6Yu7zKt8S3jACXPAb8Dm/qUe
         DtqlyTHnOaix7arFaWdJJexjOfN8673p0TnKXfVBLVyT1texl1TylF75bGY+sBCMCTws
         7q7+LzElb9dGJGd384KnumO+XSl5lgClE2xwwFBkDjRvgBoR7NtMoPSErvQFIpYMY3Yn
         ZWEmgH64xGIAiNaDy6rGPzvXbVskn783bBzjznNgBI4zE3pznMLKayJFwXXxKFQ+vxKb
         giPA==
X-Forwarded-Encrypted: i=1; AFNElJ9S+fAGtUSeiL9/z6CUfRXHx26XkP/bnYD4EyDy8AQ4N/qgCzTrrmndaOHsQa0NgFHrizOtj3A8LLhSdIlB8TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbHm56BgwG2z7EE0gUk8Jlgu7j+ssowL34wSAnWtJU3VX69HS
	woiTSL0Re8Fe9t9bTq8Ni6M7OlZz5y2HQsRCbSyuNdoOlDaFEnJvv2Q6BdDZZ9uxrWgH10m4bQt
	XH4prc34=
X-Gm-Gg: Acq92OEK57x0aTUfZzQw5dsEfngiUd1xxQZxelQZqQhEVmBhstSb7R1//BGaHqMLz6m
	6LpM6NvicTtpsItScE/JSQEv8z52wU4+TEryWCWdkkyEwhA34rbFnNV3etwd5vatL1Dg7/RbYaa
	kZeK7Ev4XeYokaMvgnTvdGU2SZn21fkolepVZywsubpI47qO8ffQI9CzC1qQvIkXMhnfiUehPQp
	bb+tKulz++o5ULeMRT77q6Z0v5QJu9T2E3wCpD9HZM0JlX92KQIwIeETmjhmpzy7FhMUHfM6lra
	bmV9KiOnFCqT1kD/msm/SWNUjX7nxgJd6xV3Rt/QPrlwjfpEkLPMXdeS2WugorI4d46UMtHzTR+
	hNVxgEB4EPzpukrO9+lrnyQ8z3lYL4BC3jWizHJGL8d0+n3Z9EOfezUPBCorjY2EOSzlMlpc8SR
	kDKzaQ0GDvUdPlM6UsOleRqsYcPj8p7P31jK9z
X-Received: by 2002:a05:600c:4512:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48e51e1deedmr377040195e9.12.1778504873215;
        Mon, 11 May 2026 06:07:53 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7040a9a9sm321328475e9.9.2026.05.11.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:07:52 -0700 (PDT)
Date: Mon, 11 May 2026 15:07:51 +0200
From: Michal Hocko <mhocko@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHUp8ulaWJ75WU5@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agG_PZ3qcl6TwLnL@gmail.com>

On Mon 11-05-26 04:41:38, Breno Leitao wrote:
> On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
> > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
> > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
> > > > is built, distributed, and rebooted into.
> > > >
> > > > For many such issues the simplest mitigation is to stop calling the buggy
> > > > function. Killswitch provides that. An admin writes:
> > > >
> > > >     echo "engage af_alg_sendmsg -1" \
> > > >         > /sys/kernel/security/killswitch/control
> > >
> > > It certainly sounds useful, but what would I know.  How do we hunt down
> > > suitable operations people (aka "target audience") to find out how
> > > useful this is to them?
> >
> > I'm not entierly sure here... If folks have suggestions on folks to loop in,
> > that'll be great!
> 
> I work with these issues at Meta, and this approach would address a real
> need we have.
> 
> While livepatch could theoretically solve this problem, it's less suited
> for rapid mitigation for a couple of reasons:
> 
> 1) Livepatch rollout is inherently slower due to the blast radius if a
>    bug exists in the livepatch mechanism itself.
> 
> 2) It's common to run hundreds of different kernel versions across a
>    fleet. Since livepatch is kernel-specific, a single CVE suddenly
>    requires building and deploying hundreds of individual livepatches—
>    far less practical than a simple sysfs write.

LP is certainly a more laborous solution. I guess this is quite clear.
It is also much safer option as it deals with all implementation details
like consistency. All that is not done for fun. I am really wondering
how admins are expected to a) know which kernel functions are ok/safe to
disable and b) when it is safe to do so without introducing unsafe
kernel state or introduce an outright bug that way.

Thiking about this I can see how waiting for an official LP can be time
consuming and sometimes creating those is far from trivial. But would it
make sense to have automated LP creation tooling available that would
allow to return early from a function and relly on the existing
infrastructure to do the right thing?
-- 
Michal Hocko
SUSE Labs
