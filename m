Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5A380FC5
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329978; cv=none; b=E27seLaiHe4WCTmqoBWIG0WVdMH1wAW0Q5q1i87UJ+Kg+pJOwOA9940khdbCx5az8HOWBvVg6XpQFMrvviUst3SN51UOH83jFBuhWDvwWqaSqgqYCLQZwjhFN3WliUp1O476AuVr904D74ViGDFYJx0+5WolWz6BMuEvypEECBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329978; c=relaxed/simple;
	bh=nvyA3TDTbhtrxdFzEjqfVphfihD1nWdpT6xp1d3CrP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwySYPaJiJljUuT/xBK7wFjHzQdi1FVRcej3YTiP1iPzy79XoWAl19f7uvWodctTMAVrMZ88uKCkO9uRLkS+4xbCsD6vaPllsSs9VKJYrQAf67wlSahQyxUHOWU7Yu2B8XgjeZrZ9VmhoeWwyqu9fgPQ4xyVECigb08cT9ybMsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvSr9cB3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvSr9cB3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so55031f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790329974; x=1790934774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnKtVfuA6DDtxDljFMt/DQAZ8I6CllqSJuo16Cr5Xvo=;
        b=fvSr9cB36vtc62nWqPWi5GwtqeyaqXo5+12p1oMlSp6oVN8Ha1/2Dkq+hhSD6Zq63w
         t7JB64usB4P6BEoQF7mehPiqyGz6ePx/WO7tm6jIrxvL3R8dgCfHaI9a8Mpfxa6AK8Qq
         kTMpNS94C6UtgbxQAjpOuhKcYQ2PS4PcG3jVJj1VD6WerbO+uVlnxvDFjUrm7Pi95nHv
         tdC6wb4QkuH+Uk7yruyYfD8voNJKk0YMPECNMBpTc1fAcdi2iIwK7V3+L9VPIB2IzaUW
         +7VQ02CjQaTZ/f2hwsKvE7HOgAm7KuoqX8ORqstjxnFrcfJ64vkrEc86tvdfMEUd4GZk
         9lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329974; x=1790934774;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wnKtVfuA6DDtxDljFMt/DQAZ8I6CllqSJuo16Cr5Xvo=;
        b=06UHj6AHlsmcqKEhyqCYMoMFDszmuA2az42TGcHtqT0L8EZlPvOlNqwdlGgFbHPUs5
         zjOn5J2hiEFMke590AaRLYmw7efKOgwoHIgAOu4KFBd0b+VQfeFB+P0WvLyMrdEJ+8fi
         jJi1sDHrmjCyPuC8p6O5RIZKK1vg0F1m6dIekUFJKCtGh00QOhJEQcPNCZ+PrbgQ8N5z
         k+EGbgqKo//nz8Nv6+TxlwALaSJmfAG/AFNmlrvy3O1UtJ7ovhRVUtEP43DIo3NFfcIC
         oAhA3bONA89uUiaEiCvd+M1ckGLafiqZFIqeJ4tmdweY+MAsTPK6074MyteaSjwxHB3e
         x8pg==
X-Forwarded-Encrypted: i=1; AKwUvBy798TZlCQldroWA8WQtSgsDbNPPTuH9/QJeXgfAiOEjwLI4dXCtgtzSbQIka43UVyh9wf5QT2dcKqz5fFqyT0=@vger.kernel.org
X-Gm-Message-State: AFuF++no7ucHRoqdpHHHeY73qKpZfC+fF/tP+qg/qzb+gXvvhccagjzM
	T4V/RcGEsRZVWwKDYFTG/OFYVkxTynN0YKrB3Nvo6ZSO3y0DogBNSlWm
X-Gm-Gg: AYBFou0EQ+HKW+zkX5LkhXxlRUBlLsivD2KvAPI6kBYOi1JzUr3Z+oQENLiTguueMyw
	1ohvlLy87GT3vov1pMIK476cX/wr3IXIw5iOI7ga6zjOXVQxJuWwFPWCLseKpN3q4jH6cHqZat6
	v8PN2J8OYyQIzdMn4gYltC1r7sYF6kn+VXI0j2SLT+RAmw1Xv0gSwBUhtqzoHaI95ebLTdzd0DK
	w3WXYVUrdlLitVophrBPZsZI2NdVChNqwNlpLE2a1/dnxqaNipRk1Q88Sd3NQu4qsRl+Ex7O3vO
	r0jdS2n4iBsJDOgieB8XRP4UBUj+DDq/R23vmSX43iGyBfn/sJrfBxG0RffzBe0mps9jdugg9Co
	4KeZu5dW56zGWkm2eWl4ICY0gxezAjmiN0B/KDOQ1zqPmrnWzznEcpjgbb3JqMZJ7E4esdUnwoc
	kkzDOopPUuxOMoy2eTOVU6H/nkzvdNScaObGJNgC7nyWRlu3jsERMpCNBbbVII1/+/lTWkVkMhC
	FPAgs/eKOhEWKKXQCDdKBmQFJpi4DpjaMzRtSZ4KAiCiXWE1hCUxAICJXCN5mZm0O7V9ew9fbQx
	MPGUsqhai8f3s4GAhjgJXvjAnNIluHptAIefM0fDJtv4oTEpu7IeYIgl7UQRlB8fLltK9sQKPcn
	rzp/6meddmDHxDTN0+R0=
X-Received: by 2002:a5d:5d0d:0:b0:488:79d9:ef3a with SMTP id ffacd0b85a97d-4887a89f181mr3916537f8f.2.1790329974230;
        Fri, 25 Sep 2026 02:52:54 -0700 (PDT)
Received: from ?IPV6:2a02:3100:5dd2:bcfc:4dfb:2ac9:70ba:48bd? (dynamic-2a02-3100-5dd2-bcfc-4dfb-2ac9-70ba-48bd.310.pool.telefonica.de. [2a02:3100:5dd2:bcfc:4dfb:2ac9:70ba:48bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm5863049f8f.19.2026.09.25.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:52:53 -0700 (PDT)
Message-ID: <21bfa8a9-c488-49aa-b2a1-4d282fd51c42@gmail.com>
Date: Fri, 25 Sep 2026 11:52:52 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: hsr: unfold GSO super-packets at the forward
 entry
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20260809121455.1745-1-xiexinet@gmail.com>
 <20260809121455.1745-4-xiexinet@gmail.com>
 <20260923104346.ur63K3h2@linutronix.de>
 <2cf54664-c07d-471f-af6d-4b70e09626b4@gmail.com>
 <20260925082954.MYDugnDU@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260925082954.MYDugnDU@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2026 10:29, Sebastian Andrzej Siewior wrote:
> So you disable GRO on the interlink port and still receive GRO packets?
> Or is this performance related where you want to keep GRO enabled on the
> interlink port?
I am not trying to keep GRO enabled for performance. The difference
is between a physical interlink and a veth interlink.

With a physical interlink, TCP data is split into packets before it
goes onto the wire via TSO/GSO. If GRO is off at the receiver, this
interlink RX path needs no extra segmentation. Patch 3 is indeed
unnecessary in this case.

With a veth interlink, there is no physical wire:
TCP -> prp0-peer -> prp0-int (interlink) -> PRP

A veth pair is simply an in-kernel memory pipe. When a large TCP skb 
arrives at prp0-peer, veth does not trigger TSO or software segmentation,
it simply hands over the intact skb pointer directly to prp0-int.

Turning GRO off on prp0-int does not force prp0-peer to split it. I 
confirmed this with ordinary TCP traffic in a VM, with GRO off on both 
veth ends.

Patch 3 splits that skb before PRP assigns sequence numbers and adds
RCTs. Each resulting frame needs its own sequence number and RCT.
Ordinary non-GSO skbs skip the segmentation path.

In addition, if GRO disablement fails (e.g., buggy drivers or
hardware-fixed GRO_HW that cannot be turned off via ethtool), Patch 3
also acts as a fallback defense for these edge cases.

--
Xin
