Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEC2434E2B
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509319; cv=none; b=o/p3+HvNQQbDzjzpW8q74JlVUW1HhmeGnkLLw/1qy0Nwvr/9VF7UhxKvYA10Msj/dEOI5eMyZ0qhLwWI+J5G+sqSGMrnE1qiGWZsX5flLkubDbqO3XwCvWQbGilP7MOybg2Sb0v9DPn4sZxpxKWcl9dvsTewNfLku3Foc6VfJ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509319; c=relaxed/simple;
	bh=+L61LaO/tSTgwUG3yNGocYARlCgeLxPVR53vlY4PE90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQxdRXTuGrmKK2OXLiAhHQC4RA5WHsSYBlsbDV9tgbCxUpP/+w+M72L3H5Yy1hvUkcBr6FeWeCLRzuNkYsuJKsliVpsXddU7FZ3bJWWhIX9YdAb9jttLC+DHnDXpwGtn1S8BsQzBaCBMucmsn1O5lat2qgep0uPeMX3Ti+jdR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGefD1xq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fg87rMwW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGefD1xq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fg87rMwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783509316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAAfDroIq6UXGR519c5uoiGAKX45EOugo6OCZQqCTl4=;
	b=PGefD1xqBog2hQ9qxMbIzn08pev2cY7Mn8XUipmx3xpDiHakDIJjqxH1Sn8+TTuimM3BVM
	9ipg8LbsN3rdZd0NtDKqwKi3JyuHSbOnjeNuBbTFPoDIjxVG58aLe+bDvvvb7f+Psxgt1+
	dIdcWf0CZ2tu5mhRi5l2pLu/pK7n3M8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-ePzZFIFvP8S61tN1ptcKug-1; Wed, 08 Jul 2026 07:15:13 -0400
X-MC-Unique: ePzZFIFvP8S61tN1ptcKug-1
X-Mimecast-MFC-AGG-ID: ePzZFIFvP8S61tN1ptcKug_1783509312
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-46fb9079a04so369942f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783509312; x=1784114112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAAfDroIq6UXGR519c5uoiGAKX45EOugo6OCZQqCTl4=;
        b=fg87rMwWUPqGWgLbsOCKfm3r+5hRK7oydya3fQT7CmssLbDie8TG8Z4UVXFlOZDtO4
         lG4WIz6bKGRWsi82UlIhjXoFY9k73z/sX4rp2IIbzPIm/swwXVEjqw92gQLHHojX0V9T
         Bhx7Sla1SdBIxaZcywQI+QV+14O36AeJ7qrGFla7p9a7oKU+IA7m+4f9h60ivxnuDvHy
         9iuKMuuTmdeLDJq4/XaV2dE6d0Zwi8lcOxkD5EYAs+OgGUaczki+39EJxQYoGxhK4B6s
         HtANEbFEhVBIOQ6zlANa4INjDDL8wIMkuZpRAw7K7mZ2nrpKXd9NcTDC3d+31DhCjM2t
         2X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509312; x=1784114112;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAAfDroIq6UXGR519c5uoiGAKX45EOugo6OCZQqCTl4=;
        b=E8ejW1rYhwk9j7rfiZzsa8IOVHzE936PWURRo+g7OBE6LRpxvsjKENyHznIPTr0D/u
         eTDLRmi7mEt4xwwCdIuQUWjumu6ROjZ2PBRSs1JevYOfAvN8w0i+/G3jn1VOEZgmd7xS
         p6rpiU9aThLpCNtYAqC8lPuut7PIfA7tzX0aD+TGOyzV7p91kK0BBKHKGSHsCZ0Z9b+9
         HsqZxqnGhBLOdQhlkEbzEohOJTDnz7e++ZNTaE1J8ZnKZQA+qpAvaFUHLdybLjebDu0U
         eedHXzfvOtdJFgU/PkOAZRVzrHkQ1HG/CuGY0gcAVJn0C/zbE1FUO31WzMJMGviAd2Pn
         1T4g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/e/a0scEF/k5RahibgO+8/O10DWnSD328mAmLCiyBFvn++S58a2Q5IPWSBYMBlu3NcL6RHYHWUg+rgTLOSQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpLT0v311n8/4tPdwsKgZBcgp9LAWD/e/T5FWS1mptQpGMgW/
	T0RMYeU3NVuNQwuYWFKpoAgwSEty02//AF90ONVU2Eezu/Qvq6wKHeOzt8qIjRGb14Lw+Y+I8yw
	V9vBfb7JKLj4tUipKk989GfSAvFgfvwnJqNDLAvCCYouVCF+Q1TuMzGciJT4s3yDXKoT9VQ==
X-Gm-Gg: AfdE7cm07Pk2mkPMwRi/BSIXJ39kIdMyAc+vQfaqtQIlR0xV8A0ty3Qu8wTQKw5LvFc
	WyHS1gxTwAhRfzuPZEvFNSl0+tTJ307hPumRgu99yckKLUQHFkN66LLUvN4fIbx+nfDVhgoM0Zk
	VuP3CDg/NO/1EGfG2ohIw3Hkohe+g4VyhEKGzf9s3dm67Jsz8+UixWoJqskoz4Lawem4ba3lZXj
	oPiWk7qBetHLKE0WxI3AqN2IGIiYgn4ovfy6SY3shG2b0naQjaqJevWPgxsCwxQ6Gqq+YXRbCl0
	Xj/K3k4WSCYXTTFzSyFGZeiPivcxz4gvo99SF2XI50ECctNBPfjnfBJft2A6xH+KUx1Au92RiB7
	KN0CU1fG06jczFJMtMaWWMNkRTG6MO4MRzrfgT3Uu+y2MgJWVeVwBZyi2WchpBWtFGzxsR7DcEV
	5rdM9xYqbnnteL
X-Received: by 2002:a05:600c:8b62:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493e6843f10mr22365245e9.9.1783509312062;
        Wed, 08 Jul 2026 04:15:12 -0700 (PDT)
X-Received: by 2002:a05:600c:8b62:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493e6843f10mr22364805e9.9.1783509311582;
        Wed, 08 Jul 2026 04:15:11 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm43419310f8f.2.2026.07.08.04.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:15:11 -0700 (PDT)
Message-ID: <e85432be-d9a3-4b70-b324-dc657617d1d3@redhat.com>
Date: Wed, 8 Jul 2026 13:15:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] selftests/net/openvswitch: add ICMPv6 echo
 type match test
To: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org
Cc: aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 shuah@kernel.org, dev@openvswitch.org, linux-kselftest@vger.kernel.org
References: <20260702075044.1176798-1-houminxi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260702075044.1176798-1-houminxi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/26 9:50 AM, Minxi Hou wrote:
> Register OVS_KEY_ATTR_ICMPV6 in the flow key parser so that
> icmpv6(type=...) can be used in flow specifications. Without this
> registration the parser silently drops the token and the kernel
> rejects the flow with EINVAL because the expected ICMPv6 key
> attribute is missing.
> 
> While here, add convert_int() to the ovs_key_ipv6 and ovs_key_icmp
> fields_map entries so that specifying a field value produces the
> correct wildcard mask. The IPv6 flow label uses convert_int(20) to
> produce a 20-bit mask (0x000FFFFF), matching the kernel constraint in
> flow_netlink.c that rejects masks with bits 20-31 set; byte-wide
> fields use convert_int(8). The ipv4 counterpart already does this via
> convert_int(); the ipv6 and icmp classes were simply missing the fifth
> tuple element. Existing callers that pass empty parentheses are
> unaffected because convert_int("") returns (0, 0).
> 
> Add test_icmpv6 exercising the ICMPv6 echo flow key. The test uses
> static neighbour entries with nud permanent to prevent racy NDP, then
> verifies in three steps: install icmpv6(type=128) and
> icmpv6(type=129) flows and confirm ping works, remove the flows and
> confirm ping fails, reinstall and confirm recovery.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>

Does not apply cleanly anymore. Please rebase and resend. Note that you
can retain Aaron's ack.

/P

