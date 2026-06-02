Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D08331A63
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 02:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366331; cv=none; b=Gu6XAL3/fTfDK/F1S7OEDLDtNzaSBT2jAOHADtaXuEqCgaZsGFsZ5VCgizvhDuPPrT+mFpe0l1Orb6Kya+ZQAK8HjzxWQezlUd38omsVqCcgvAvY3Fq9bN0mgEBQRxmHjFZ1enfNvl3xXUKN4L0k/uoQGgCijDMBB2C+jnaMReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366331; c=relaxed/simple;
	bh=UZe1VQbg/A8h5bszj/xcfUf8HHkK6UavcECVZEQck18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIq/bo4OMXmVidFB1jgCD4X10xQo3CRA3s90X0TOTYG+4bTlJs+odpgqID89FBlkDgWejG2unDPTYKZlQKe2xD0LmkZam9013UgEx+OfhQqHHRL1uP++At0EAK2nmLwpoanIAxZthRIIlsTPY7tHTYdMTM4wEajc0I6QWyBlpqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GIkV6OIl; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GIkV6OIl"
Message-ID: <021e215a-624f-483d-ba19-7c130122bfb5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780366326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqqEW4JqlqzJIsw8D3pVFU3QcwiKj674UK8QDudzFI8=;
	b=GIkV6OIliUEDfFeuec4CXiKrfXyiNHKr0PUsJljCdpUm8oWDz51Vzuomc0rMshfzShlksM
	IffJfsvzocAoCJUi834S47hnAaBzlGke3NbBEs/t2ayGpnT8O83kNqDqyWgen580enfTHh
	jhAQQD/S2mWlin1VWAh9EsG2Yfa24DU=
Date: Tue, 2 Jun 2026 10:11:49 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3 1/2] bpf: Update transport_header when
 encapsulating UDP tunnel in lwt
Content-Language: en-US
To: Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Guillaume Nault <gnault@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Peter Oskolkov <posk@google.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com, Leon Hwang <leon.huangfu@shopee.com>
References: <20260601150203.20352-1-leon.hwang@linux.dev>
 <20260601150203.20352-2-leon.hwang@linux.dev>
 <DIXVJ45H90X3.3DOQOUXJB6DVN@etsalapatis.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <DIXVJ45H90X3.3DOQOUXJB6DVN@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/6/26 01:03, Emil Tsalapatis wrote:
> On Mon Jun 1, 2026 at 11:02 AM EDT, Leon Hwang wrote:
[...]
>> @@ -637,6 +644,10 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool ingress)
>>  	if (ingress)
>>  		skb_postpush_rcsum(skb, iph, len);
>>  	skb_reset_network_header(skb);
>> +	if (ipv4 && is_udp_tunnel)
>> +		skb_set_transport_header(skb, skb_network_offset(skb) + iph->ihl * 4);
>> +	else if (!ipv4 && is_udp_tunnel)
>> +		skb_set_transport_header(skb, skb_network_offset(skb) + sizeof(struct ipv6hdr));
> 
> Minor nit: Could we do something like
> 
> if (is_udp_tunnel) {
> 	size_t hrdsz = ipv4 ? iph->ihl * 4 : sizeof(struct ipv6hdr);
> 	skb_set_transport_header(skb9, skb_network_offset(skb)) + hdrsz;
> }
> 
> to make the logic clearer?
> 

Make sense.

Thanks,
Leon

>>  	memcpy(skb_network_header(skb), hdr, len);
>>  	bpf_compute_data_pointers(skb);
>>  	skb_clear_hash(skb);
> 

