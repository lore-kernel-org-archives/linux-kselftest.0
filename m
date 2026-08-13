Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16297416869
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619766; cv=none; b=m9F80APYntXjeHE9XQkvuRZ3BXePchGBt+m53vm/luJ4891tpdEL8d8acDpMWPZu8aihjT3ltPyOgkD2NbzbLXyHnsZ9stveXKyEV7TZqxkIzw0Y8LaOp0qh7NfGGybcultxCs4RjmhyA/QxRDuV10w8gqXUgyQ2AduYa2Ca5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619766; c=relaxed/simple;
	bh=eCtC6QgWZJI49Osw7++8fZemrdIWgMW8ibmZR93kf9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rI78+BOY7Qji1Twf7FvqdTV/rN9DjgB1DY3SWPHAdBHK2PAQD8uQf3U1+RYLMikGEccJDscvl6AFY4FSHomkA/wcI8rX2S27vh7TdcOF0dISfLZFlrfF7eGbaKrBro4aWHhTHVPqoMj/YVPMKZ8JxRhV7ByqzUQebCmmzN/+Rw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VO0DnKeC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p15V5/nm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VO0DnKeC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p15V5/nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786619760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCtC6QgWZJI49Osw7++8fZemrdIWgMW8ibmZR93kf9E=;
	b=VO0DnKeCJYKONCJ/aouUOrnbgELChnbfWvYgVYtGgRG2OM651U/Oa9rR9xWVBdwhItvKij
	iWRax0OeiGN0FktetsrZV7inRVuX3nwUJP+mlJtwRs2gyXPZ97QC7G0S++AC4g9ln6DKRz
	unx5fC2i2t8onlbinnTmRYLDVuD9Abs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-JN_vPpu1OXSey7U81WLr7A-1; Thu, 13 Aug 2026 07:15:54 -0400
X-MC-Unique: JN_vPpu1OXSey7U81WLr7A-1
X-Mimecast-MFC-AGG-ID: JN_vPpu1OXSey7U81WLr7A_1786619754
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso12171221cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786619754; x=1787224554; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eCtC6QgWZJI49Osw7++8fZemrdIWgMW8ibmZR93kf9E=;
        b=p15V5/nmCx7YfVZt38+gstLpHktrhVcwEispL7N9eP9nMLI8B/XUNB/QflDbjoC3dH
         Yr96B4Jf8OajlDulHNe6i8QeiuJWUOIz/nleBp/BSDpqGNcS3cSjrUsbrD05HCsbz7Zk
         aoXLf3dv1LRl7ZPqSxEqBm2D+jaVJaZhzno+jx3a8gy2Th2OdrNHYHvEc+5vltPckxvN
         Qp0SusYpNz0KTnvkhFe3jPrAFdOiA5bQhMY2x3ALSqubrTkfEWOYzEDHmgd+iC8Uwh6i
         ZBTf1z007k/PK5tncuDJZ50axq2nP6KPjQTDO76LJbcP1F+gGCqH6lEc/hXMlDD6W1Qo
         Xeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619754; x=1787224554;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eCtC6QgWZJI49Osw7++8fZemrdIWgMW8ibmZR93kf9E=;
        b=HXQuDMDSFA91fd4JvpQufI9fPaDi1dmd49MmaORO/Ru0c4owinJcraz/+wAkKpzHd6
         uz/fErtB1p28luRunJ2lxJSAkvnG7WYLscQb/rzPKTkJ8jUlWbt7h9Ed9OTvRcMAI9qI
         gXAof2QnCubeaL0tVtoF0et0tsIEAmD5k7AvztbjNa3iUadtd4GTEpSZdNsP96SGdBUS
         z924v7pGW84DYn1QlmI2OwX/Gd2xw5Vl5homUOBHCXAkxiDmEx6LRFXTusrkj78TeAY2
         mdgdCFvvW4vbziWp4b2AtWMln9ESf56bXCqhur8j63Qbs2ya2VvXp7Zyht/r6W32pyRI
         E5hg==
X-Forwarded-Encrypted: i=1; AHgh+RpEJpJ4G6ZZaO8oJ/xqXmcV49qef55E5NgRdc0l6+Ca+n77futpFhhI6lpRHnhRob7cZ4nfHseFVlKo0921O0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUmzmt0dCuUVRWMYg8U8kXQGprQpebG/tXGRyi0iYmi9iOiSj
	FwNIpRJO6N7RP6xk454WCyfBmhm7oZQ0bM1ft8v3XZZfWHBWXkCaA0wDtSiM/1bfXHHWD8bPjlB
	J1k0h9KvzE4rloEztxBhUXKx2H64o6uqdNv4MyDaxpaEOAZ1D+FT9G5qF/fzQKcubm9u9lg==
X-Gm-Gg: AR+sD133fLYvJdeHvrbpmhoBgt+WvF1rDmlTbvHWdoRFcfQGiWEbB7Bx8WwthWDYSoo
	I84S+H9Qte6Pp8Vw0uoeHlxNFXGWLmDCBaojWJz3rHHWkLIl7UpO4oUzvUdVTq00C4diQX9zTjP
	4sSAs57EyFSQD4/Mn1xNV94E+WxeDUW67fLMcHydnk5hOGu/PtJng4ITAygXz6dkKdbFDyco47d
	WuL9eWBNkiZIKZJO8OmfOou1SqijeXWhrQJjsn9oGZ/qYjqWtuwOib/4Pz82+eqs7Fjhn+3fdhO
	fpBp+/Nm6WFTKIE32Gn9lI0CBf65YzP9r3E797uv9YmZ34qDbQX+nxaGO4Xl8ItNbf42vIExr+1
	ADbjAjP4oXnDGnPBS89+iVedqj3sn
X-Received: by 2002:a05:622a:590a:b0:51b:9873:e37b with SMTP id d75a77b69052e-52d751c7c1dmr41466651cf.9.1786619753846;
        Thu, 13 Aug 2026 04:15:53 -0700 (PDT)
X-Received: by 2002:a05:622a:590a:b0:51b:9873:e37b with SMTP id d75a77b69052e-52d751c7c1dmr41466021cf.9.1786619753443;
        Thu, 13 Aug 2026 04:15:53 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73fb89c0sm14535951cf.18.2026.08.13.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:15:53 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  davem@davemloft.net,  dev@openvswitch.org,
  echaudro@redhat.com,  edumazet@google.com,  horms@kernel.org,
  i.maximets@ovn.org,  i.maximets@redhat.com,  kuba@kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  pabeni@redhat.com,  shuah@kernel.org
Subject: Re: [PATCH net-next v10] selftests/net/openvswitch: add SCTP flow
 key support and test
In-Reply-To: <20260811181645.1918420-1-houminxi@gmail.com> (Minxi Hou's
	message of "Tue, 11 Aug 2026 14:16:45 -0400")
References: <20260811181645.1918420-1-houminxi@gmail.com>
Date: Thu, 13 Aug 2026 07:15:51 -0400
Message-ID: <f7t1pc2fezc.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Minxi Hou <houminxi@gmail.com> writes:

> The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
> flow string containing sctp(src=.../dst=...) parses without error but
> silently drops the L4 key. The resulting flow carries only
> ipv4(proto=132), and the kernel rejects it: match_validate() in
> flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
> IPPROTO_SCTP and returns -EINVAL for the missing key.
>
> Register OVS_KEY_ATTR_SCTP in the parse table and add a matching
> selftest that verifies SCTP flow key matching (sctp src/dst port).
>
> One listener serves the whole test. socat's fork option handles each
> association in a child, so the flow rules are the only thing that
> changes between the three phases and the listener is never restarted
> underneath them. -t 1 bounds how long a forked child lingers after
> its association closes, and the existing kill -TERM of the captured
> pid on teardown removes the listener itself.
>
> Also enable CONFIG_IP_SCTP in the selftest kernel config. The config
> checker strips underscores before comparing keys, so the entry sorts
> before CONFIG_IPV6 rather than after it.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

