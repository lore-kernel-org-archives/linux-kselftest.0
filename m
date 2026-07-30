Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CEF36C5A9
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447582; cv=none; b=Z0Tmw33+ulhKo3vfaZBbt0laNY/fkukgIUsTRSQDQJInh6pZrPp9BJ6vPYjkHVPvujLye+Ux9VVSpQl5vb8/Z3TgbDx/ehYp9WUoKugEVwmlxvx8vYveg4cPRwfvKUFZXacTPljdTzjajPvx65nYHssJBiyD8EDqhO7/pd0CNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447582; c=relaxed/simple;
	bh=9tJFneElzryi7QJmNthwEc9KGHFEub4YMJqT7VjvA3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv1s8u2KsjbBMEupANlL1YVJ7b0k/SeiyVnZYAasnr93iGrx/TvoeWrPPzvc8B40fpGOdn5RdRRSatzTKiU7soxz80QeUbOFLrpMW5vRBxU+dSnAp+oAkL9w/mOCNyNl3YE/Ih39/gfx0aZN4uCtISocXREexu+TeVltRXRUo30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ/vL1Tx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ/vL1Tx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e04df8c46so397276b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447580; x=1786052380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlBdZN/Yu2XetCK2pd4kqserGOdzhIFqZOg4RXy2UAo=;
        b=MJ/vL1Txjc8o5qEj648LXNRRPCEFXsBDqVTHyJoWsmM8tHroGqmL5B/ByAJL+x7EKW
         Pq/QnOlAJUB1T9kPDMrbYeJwjt227n5Zm7cmKWmJ4TWhBtJz/eFerq0dmAU1WVevtN1z
         hmrK4UpN6vPJIc/WgUngSBeVWQw++a6Md8JI7creJzt3YSKLjlixCUAewrts+5/n3JKc
         Ht8sbUrj3KcvqwxO12JF8U/PdKAPevnPtRt5jCpDKBkeLXmFmI5GAOFjyP0oQOncaiWY
         ditPt31Lth2es2ej8oQWV+23S0q32vfzSOorHdlCpe7/Xd0pGVzyKiAJPjUDEpi6FYvS
         cAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447580; x=1786052380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlBdZN/Yu2XetCK2pd4kqserGOdzhIFqZOg4RXy2UAo=;
        b=ow+a0/lwNpQxevvIUFEhZpVF0MHlKoLA3I6sNUE1J0rUkRppYHBcG5uyYADllkMdZ8
         yCFTT5+/43mzikvDgKirmN+78Y0a0GJmCPIAkY//GMrOSmus09BxJp8oVCYUxubqeUBM
         eblfutcp91oth/JJxLDCUVf3P1x55COUYDE7K7ElF4Iofwbl1fZgKXt2DZnc1+oKl93k
         TMRw6skSmPwXDXqGehEHLCMA9mtRYqAcyMIEo30Y93XANK/IvVzyK1ZO9eJNm66wd3Th
         L9YhgVACCixeRXW3NPPpp0AK9wyy36D8X7LGFXpoEuPJFrar9LKFywDnF6mJE9XUlf27
         gOxg==
X-Forwarded-Encrypted: i=1; AHgh+Roo+PtLZU31txvkPUUvU0+INK+xlKJLqTWXLoxxVpL/YoIEZN+izZUc2i5TK8fu3m4gTCSkkOuuw4+Wl6WcOBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrwqWKlNuidYwDwkZ30bcYHRODbchAvs9XRlb6cPjjOcD1egH
	Jjle/qWn9kN1RThH0ycOwFVnbOcU9WTqZGWc7GAE1s3r8yQ+93sEBu2j
X-Gm-Gg: AR+sD10Pum2TCGcrJokcZF1BmgAmiAJhhzRuDRNhbuPQaHtvXHxPK9UzTbZR0Xoquyu
	5r7ZzK1MkQjszshqdRTQeYYAIyIZX3JKKbMYjG2oRgio1wumLxIIyiquJoRloN1Sfk5akREM8uL
	t4AAkPrvNOA0r+iVmSR9wXkIkOkmRX0zE4Eo4jUqzfF8Ykd6smTVO0BOGiYa2ZFouFPEe62nbrM
	gUQFJmHi3t0yFfZAwGZCceXUPKt8x3MtTQHxvZB9/sakA72ARHWs2moyFM3w4KJoj44zwqDpt3p
	ObzTyA7XYXKR44WGIkiB3B5594SFtZlvoJxO9+w0wckLqBNHwo87fCChN23yDhldY9fjUXpc9dn
	dO71L2TEB912CGA21vqHN4aVkp/OiGEhoeFaJS5yMDAHyq8920Z+ECgfLgDQc/g521UqktG85Hb
	REwEhsyG68rMusbb7CJL6hbIN+Pm4eLZtTiiZXiIVZYdX4mZ/xxurhuAeqfh/XF3uJAIHjgTgtm
	0tDVFOT+A==
X-Received: by 2002:a05:6a00:2a09:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84ebc2685a6mr3911212b3a.31.1785447580388;
        Thu, 30 Jul 2026 14:39:40 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:46::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe1d07dsm3618306b3a.8.2026.07.30.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:39:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 14:39:37 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amvEJVio9XtCn+YT@devvm29614.prn0.facebook.com>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-3-7975f62cdfbb@meta.com>
 <20260729191649.55ab7942@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729191649.55ab7942@kernel.org>

On Wed, Jul 29, 2026 at 07:16:49PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 14:21:17 -0700 Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Add a new devmem test case for binding the dmabuf with rx-page-size=16K.
> > The test sweeps RX payload sizes straddling the niov boundary to cover
> > the sub-niov, exact-niov, and multi-niov RX paths.
> > 
> > Silence pylint invalid-name (`with open() as f`) and too-many-arguments
> > (ncdevmem_rx grew to 6 args) at file scope.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> Hm, odd. In NIPA we're getting:
> 
> TAP version 13
> 1..1
> # timeout set to 0
> # selftests: drivers/net/hw: devmem.py
> # TAP version 13
> # 1..5
> # ok 1 devmem.check_rx # SKIP marked as disruptive
> # ok 2 devmem.check_tx # SKIP marked as disruptive
> # ok 3 devmem.check_tx_chunks # SKIP marked as disruptive
> # ok 4 devmem.check_rx_hds # SKIP Test requires devmem support
> # ok 5 devmem.check_rx_large_niov # SKIP Test requires devmem support
> # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:5 error:0
> ok 1 selftests: drivers/net/hw: devmem.py
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> https://netdev.bots.linux.dev/logs/hwksft/BCM57508/results/755681/config
> driver: bnxt
> fw: 237.1.148.0
> 
> Any idea?

Poking around, it looks like 231.1.167.0 and above should support
everything, so fw should be okay AFAICT.

Looks like the config is missing CONFIG_NET_DEVMEM and CONFIG_UDMABUF?

Sorry, took me a while... was certain it was a bug in my code.

Not the failure here, but wondering if this was on ARM led to seeing
that 16K hardcoded rx_page_size in run_rx_large_niov() may fail on ARM
with 64K pages because it will fail the IS_ALIGN(16K, 64K) check...

Best,
Bobby
