Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111010;
	b=fi40l7JrVoWHagzXtlh/1TQS4zli5BNGFAammfbDeHYv/2DDHbKskXmJWaMxnXlB4LMc
	 ZWwmDEn6U5kEDVhqNgJ6on+FoOk0QSX8sdSQEkFSVhe9N/G7oSJPPajrPuQQN/5sApX6c
	 lqc/dmbZZ5xxxEHlU1NHor8s2amipU8mDEqOgviNi12UMOsseStUH6CWSys7L4IVyxt+j
	 HSsGODGZpAdmEX2RGYZ6Ynzr4csL+tjXmIroT2tKRXUezM42wxCYK0+LStl2CGplloegi
	 bftNBi9iBaBX4YkiJUW2RhEgZVb1lkIcyeKyu2Pp+IudA5qLbb8leC943VXW4E6Zk0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
	b=hP01erc1S9U3h7OpsP7xIqcXPAeLI7vpGzfdegm6XfSkmnucKcTQV0xNRTYURLLpNZv4
	 jMMSBwMjP0+/z6Zcjr2JDI6zZPJeZcwo2y+Eqk7+ZGXzPDwmCoNnffJBdy75eemSpNLUJ
	 +xmypdA2r7+dEgNOCsr2o7SWq7ift4WcBMBpW0pPSsf7BrgrBquzebxJheeRHmqa5elSS
	 Qcra6ZXVir0bvKHhQxRtomj7ymglBr2CHS5bE8LuEh/7N6bAD7iUKpIMyeaA5sBxwftld
	 i9mcg291Rf9qKFq+tbgSrZCujPo8vCsBRhr5sY/cwQZcUVwJVlX64OdRQTis8RX0gGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMtMwajo;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131C606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 17:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A131C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMtMwajo
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so3643732c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111009; x=1795715809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
        b=cMtMwajomCbRVs7vFzFO+TVH7BBmXvJ6KhEOdHb24rMRDDivQa4ovhTh+ohAbTbD10
         2wcMWdnjrJqtkoxuieDUiigbcMjfipl+dsU/AqwcjTpjiXSGey79EsbmxzJxrVYhSedK
         oXyHitLgTWKd89l9EaUK/SUo9UszWgaxDTLpHSNOw3iHBRcbcbrgWcYo4DDPOCrAKd4A
         5s0Q0GkFBqhP58ii3+pp8uj7O4q88/+h5OEreWP6zAXqL1EqoOoSJL3K1mZhWDkdZIo8
         hGcFNg/rmNAGqoKHsSD+3pvsUHr3KL3slHwvGpH5gIs4NlaTuGQBR6nRVX4njna/V4Bu
         xREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111009; x=1795715809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
        b=fAYdOBt88brRJ8RcD3REtwYRMcvYEfpnA4vWmmhzZRwGovv862Hf1Y0t5GrrWaGlJJ
         UBZt0SFHAAT075rt75xsFzm45S/ewkL5C2CTE/5KsB1Q0wLeOngW+F2Nd1LDy6rkebNf
         eas1WbOYGtylbRzRqV3QpvG/MKE0iU1PA//9zMRshhC5nLzWGK3wvlwo5aBoJ6MnZl3s
         khJfF/3FZmB2q2uOI1/tZKzDTbKlNZN209lvVXNTG7NGX6jRBsTa3zBl4e3LWCbUC3v9
         d4LD7bPWftWe6Ecl5In9rDXMRRFsvvO0VK8PXi8ADuiy2UxzMIMafKcmxOhp2fet84E4
         ouIg==
X-Forwarded-Encrypted: i=1; AL+hErGHsy7dbMHtGxTpIC/ap8qwntRuzEOIWZoKvWnG3Sk5YXQ7bqfFX9nYAcuRj6Mw8+gdFSsqXa+Jci3Du6RlyDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vzRerKoPPq3PkB5vcRwKstQ7O2yB7/6QWCIeB6lGMHOR/JVxi
	X3cF7Rd2AFz2ADiI6sNG1de5NS2F+ATAYInJYJ38PRS4T1nFIC5QFlCo
X-Gm-Gg: AYBFou2W2vhQ+6MN5f8fAgNdf++i8HvvVZGk5KSSrk3dIjZCAX3pOE7Bo+tyUo5k3PB
	yf2//eCALvgEow5crlcSjKZHsGxzE6cDkEAOpp1EuTmw5HBJTesZtxu3x1tiU4M4zGsL055iT67
	2QoNuU9gZ+eKTkMclJ17L+Zim4tx7zgUp7kuSgwPRDCDXuwGVvvdlwXE1gAAzyqtvSLYrJQLzHB
	pduDLR6tojIjLbGBIUHh+5+HjwGF9Q3Rtn7vryn6jH/zUhEMW5jH6SkAwejmQ3okHwqUL1KEXzk
	djmqFgbu2c5sUxpK8QGgvj/cm5JznmWXPxRb2KBB9CRDQ593AtTL7JQrji9oFMMUD4uA2Rm8Rsf
	3OvX0FqKog+ak/seyBR4CPKYnmoilFLhed633FXYX3hDwbrnf1B6dw5C3loRLZo2oC9NPf9DgRR
	+tKuCWQ1DKhuL4+5MBo10h42SaeDk34x6GjGxsg70k5QP/zKMjw0EvSjRvoYCDEV9sPM/qzIfz+
	llqMmnNBePSVCQC7HhRjFt5tOfpPnkezGtfhZWR7fl509A3yPEvIHyeubnJdku7BpYRGUaBuwq8
	Ng9GN+fkEurUm3NhiqeS5yxi6cv48sBiyg2a0SPYWDwEsO9TenxMy+k54EOabm17WYxfIwIZpGY
	ncyJODIbYRkMlcrHm
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr351438c88.10.1795111008699;
        Thu, 19 Nov 2026 09:56:48 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:3ffc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm741715c88.12.2026.11.19.09.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:56:48 -0800 (PST)
Message-ID: <e10e6b18-ec08-4f21-b972-b63c73ddfb25@gmail.com>
Date: Thu, 19 Nov 2026 09:56:47 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 5/5] selftests: drv-net: stats: query timestamping
 stats while down
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org,
 almasrymina@google.com, vadim.fedorenko@linux.dev, daskald@meta.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
 <179508206338.3136.8445234401487583362@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179508206338.3136.8445234401487583362@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/19/26 1:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In check_down_ts_stats()
>   (tools/testing/selftests/drivers/net/stats.py), if a counter present…
> 
> --
> 
> selftests: drv-net: stats: query timestamping stats while down
> 
> This patch adds check_down_ts_stats() to the drv-net stats selftest. The
> test reads timestamping stats over ethtool netlink before and after taking
> the link down. It then checks that no counter went backwards.
> 
>> diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
>> index b08e4d48b15ce..e61db30b51817 100755
>> --- a/tools/testing/selftests/drivers/net/stats.py
>> +++ b/tools/testing/selftests/drivers/net/stats.py
>> @@ -220,6 +220,28 @@ def check_down(cfg) -> None:
> 
> [ ... ]
> 
>> +    ip(f"link set dev {cfg.dev['ifname']} down")
>> +    defer(ip, f"link set dev {cfg.dev['ifname']} up")
>> +
>> +    stats2 = ethnl.tsinfo_get(req).get("stats", {})
>> +    for k in stats:
>> +        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")
> 
> [Severity: Low]
> What happens here if a counter that was reported while the link was up is
> missing from the reply after ifdown?
> 
> The kernel only puts counters in the reply when the driver filled them in.
> tsinfo_prepare_data() resets every counter on each query:
> 
> net/ethtool/tsinfo.c:tsinfo_prepare_data() {
>     ...
> 	ethtool_stats_init((u64 *)&data->stats,
> 				   sizeof(data->stats) / sizeof(u64));
>     ...
> }
> 
> Then tsinfo_put_stat() skips any counter that is still unset:
> 
> net/ethtool/tsinfo.c:tsinfo_put_stat() {
> 	if (val == ETHTOOL_STAT_NOT_SET)
> 		return 0;
>     ...
> }
> 
> So the second reply can contain fewer keys than the first. When that
> happens, stats2[k] raises KeyError before ksft_ge() runs.
> 
> This already happens with wangxun ngbe/txgbe. On ifdown, ngbe_close() and
> txgbe_close() call wx_ptp_stop(), which does:
> 
> 	if (wx->ptp_clock) {
> 		ptp_clock_unregister(wx->ptp_clock);
> 		wx->ptp_clock = NULL;
> 		...
> 	}
> 
> After that, wx_get_ptp_stats() fills nothing while the link is down:
> 
> 	if (wx->ptp_clock) {
> 		ts_stats->pkts = wx->tx_hwtstamp_pkts;
> 		...
> 	}
> 
> ksft_run() catches the KeyError and still marks the test as failed. The
> output is a Python traceback, though, and not the "went backwards on device
> down" message.
> 
> Would it be better to check that the key is present first, for example
> with ksft_in(k, stats2, ...), before calling ksft_ge()?
> 
> Also, when ETHTOOL_FLAG_STATS is set, tsinfo_fill_reply()->tsinfo_put_stats()
> always adds the stats nest to the reply. The {} default in
> .get("stats", {}) therefore never takes effect, and it can be dropped.
> 

The preference is for the test to fail, as this is unexpected behavior.
