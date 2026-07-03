Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44D38887C
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061432; cv=none; b=PxJHhrY3zEHP1XEoLo0TLdXPZfrLb5xvO1JCwOJrvqULTR+td8dGLQ/hveVcO4mrMd/9KkwddpQIZjb/AjsB46eqKSSDEJ27fNXlBpMu2E6Q8Ug8+xueDMuzt44sxA2FtD+RvuYrP3fDNIgdh6v0jyWsQaJ6lnwCq5TU7tXSAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061432; c=relaxed/simple;
	bh=FAHgEr0+qYzyMi2GMfvTD6+0+azG/R/j9asAIzLTAZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0aiWnQVPhaZVYpsgtygqR+w80rOZsW3u31BOqZhN5hcqxEmlN92phCS5oYwXZ20pd+YfKtGcq4BJNxILMCKlg69Zl2eutNwGZmzTlqEonf42lVcroD1ZVhpwpOpneO224IDlN9W36OgowS6IVeLmRc1FNI1qzx661Ke37Kq+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hnVXtDMt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sZ9me5Fr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hnVXtDMt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sZ9me5Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783061428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZoQqgKDmro48PzsrYUtUQsh7adKe/rqnmsjXdwyuCY=;
	b=hnVXtDMtWxtEDFWhgDkFkt6KHdJelFINXoc7p7W4ogfKmDwXTLGBfXrnu8tcEXnFUQjiv0
	JRT/8t2PntLhZKR0VTgwxI3D/j596tXERzLPGaA0ASrtzz4h5lfrWp7wjuLPHWp+tpDceV
	AVNr4Ji8ipKgx5sqk4/i/dnDM7RDerc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-17yOlH39OmajVn9S_ddZ0Q-1; Fri, 03 Jul 2026 02:50:27 -0400
X-MC-Unique: 17yOlH39OmajVn9S_ddZ0Q-1
X-Mimecast-MFC-AGG-ID: 17yOlH39OmajVn9S_ddZ0Q_1783061426
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4729d2a64efso1012659f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 23:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783061426; x=1783666226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZoQqgKDmro48PzsrYUtUQsh7adKe/rqnmsjXdwyuCY=;
        b=sZ9me5FrNo5YOzNwOhyNA+RzIVG2Td313rod9/bqm3UO4sPD5KNQ3MkRuesbkSUsEO
         bkaQSOcLbNHxA+vwBBIt+FpeGfIlyaXCt/x6ZRDJLVQNKIWXLIF7urNtnfwwOTukgFcV
         ELAMSZ8PV3asYtiZ+TIsnUam1OPgQbvutz4Tk4WqYXZXjJmoWmpUP48LtzHZt0VhJqgp
         E2YS5Mj9Ue3cEL1RvgsMgQutDyTXGcFgIYd17BM2FloBUAonatoWaBg+B/qvN3/Go1oB
         p5dieT61jklUQK73kB61C7XhA3OiXG7xgngd8wxp4z6e7ptKq+dfTUBMWOGDV31LOix9
         CEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061426; x=1783666226;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZoQqgKDmro48PzsrYUtUQsh7adKe/rqnmsjXdwyuCY=;
        b=iShudK5c5ctHNNXJ+DyVcApkuVQGJiRTW5I0iHn3VJbxNgVGqaNaSBWUlPS0phKxCA
         66Nmq3WLoLrnz566Cnebq0IKz74Ayx9rVe7w1DmYsOQnVgI3kjlZ3eavUzyKr8yQEsRs
         1EDD4ZYssCCitSakgAF7s8xQjjYHrQZRrtrZktLoVmgpSQhMuUKhR67dY3W2KvhqboO6
         FVZsdbqkgAEhXlp3gIr1go9YfnoybFtXMq7sr5hCdztn0czpRnu3t6FbUEgjGWjl9pXT
         NNxiZSjh70J6GZHQWLckpEMbEcaCkwKW25jZkrBhGb7FLrA7vKUWOSTYTfQUSYjZoMlA
         81cQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlcVr/k8UIWlyFInJ/WFAS04aj7Zn7x0ZDD1JgbWy+qbj4Lu1uFI9LyjN93+DSXQbAIFGrBpB3GG87zqdkPJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYPO3EYQpiexXglRP/s1sC5mrgE6Or6juZ6FmyLFqwfiTTwqX
	MpBRGt66U4rGS16e3X1EG8eLBzsYgl/g9KQldD5XG0kKAY8JYK2kbBH4jzAdxLObn67wHEU5Yz5
	ZqrM0pS3Lu9xzYUALBCsynKmyFbW5sSDXG/qvJIMXiTbGbd+Iw9nuRhDI8qMxQs81tjw1gw==
X-Gm-Gg: AfdE7cmMiJshCVVNCN/L/EbCuH7Z8HhUdtoHgpX42jMKQF1kU308HifnwEVTSDZqg0F
	FTHdXkeqOyq9MhaxDTLndnjdSxhOeyoUeKRh/e1imoA0idX49zfNhBfL4wpXcfthyPkTdb6+dP5
	VKMKRgQ0fZePNL3vhzploiT/CCJsKh78TaRwKs7dYspWnXRa7E/NZeE2cYC7ve2EzMAPcAzC/Ud
	Opc1X9GqAtq9WxmD9uSnS+kpszidPrOptFLIq5VBnsYsYyTfX8g5zovNb4zP8f0kZNxzHYx+R86
	zet23e4sZBZzxtmz5sEnHlaa05hT+huTyILjWklUTYgPydjXcX5ebGYJrxTtiFK/PMe9WIPdQhM
	DUDt83nxygaKDSpzAWSwaUAWEOuaQ6oi7ns4n9Z8gM+/fWFICKlDP1ylVGww6KphF6hlLmyDa9I
	X0YzMEuKJE0g==
X-Received: by 2002:a05:6000:112:b0:46e:6959:35a7 with SMTP id ffacd0b85a97d-4793657c2cdmr2990079f8f.22.1783061425987;
        Thu, 02 Jul 2026 23:50:25 -0700 (PDT)
X-Received: by 2002:a05:6000:112:b0:46e:6959:35a7 with SMTP id ffacd0b85a97d-4793657c2cdmr2990062f8f.22.1783061425565;
        Thu, 02 Jul 2026 23:50:25 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm15116562f8f.15.2026.07.02.23.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 23:50:25 -0700 (PDT)
Message-ID: <2a0033b6-9a54-4de3-b1a8-78d4bc815f56@redhat.com>
Date: Fri, 3 Jul 2026 08:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/3] net: report multicast group user count
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260630110207.37841-1-sigefriedhyy@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260630110207.37841-1-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/26 1:02 PM, Yuyang Huang wrote:
> RTM_GETMULTICAST reports IPv4 and IPv6 multicast group membership, but
> does not include the per-group user count. Userspace therefore still has
> to parse /proc/net/igmp and /proc/net/igmp6 to obtain the Users column.
> In particular, this prevents iproute2 from moving "ip maddr show"
> entirely from procfs to rtnetlink.
> 
> Add IFA_MC_USERS to carry the user count in RTM_GETMULTICAST dumps and
> RTM_NEWMULTICAST / RTM_DELMULTICAST notifications for both address
> families. Update the rt-addr YNL specification and extend the rtnetlink
> selftest to verify that two joins increase the reported count by two.

Will you take care of implementing the iproute2 bits, too?

Thanks,

Paolo

