Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2553B42D0
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928485; cv=none; b=SjvMp9/AyxTKX/hvldGQviytvQqiD9Uzn2Y2fR05pd7nx9kTDuYQSTl1rJJlX0qcmMINNSXx9KCxGTQ+8Bher64rU2wYTP6aQ3eV6/q5mn/2r05iW46x8S5s2RenmZdiDqJFv9cPdmKHH7A8iQ8347SOOjPyeIjanu1nYUeV07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928485; c=relaxed/simple;
	bh=d7+ZA28gDUEzj5iD4x7F6ajfXyIC1ya4ecZFfAjKLJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV9/86nxZ1gTz5kQPwjFgIgDZtARkwIlCHp5R8pBAPLb/gQVxcaCU9NSNvrfFCBnpBfxbjwkpsv5caz1bPIFrkZOzX/IlsCZxCreAiYeAollDXbPNznBXOScBJTkG4YeLG5QkymkFm2smwJtnRpnaSw3W3jnKw1XwSXZD/S0vm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTd1TKeg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTd1TKeg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so1615795e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928482; x=1785533282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7+ZA28gDUEzj5iD4x7F6ajfXyIC1ya4ecZFfAjKLJk=;
        b=mTd1TKegT1M0AevtMMqqZ5qMfpK7raCR7X3cekfKcrYxJDz8BVA4I+mWT82RTSj4kr
         yQMdneP0QMcWhwn3yd0BXo2N5qfISYLLX8vufGV7cfc7Vwf66HJtNwN4GZ5MGukqINY5
         MA4kV0tBEMFI050/ChuMI8yqreIKRRlRK/Ym/+Gmp61iP5cg47JYdZFQNA+Uv9+gfrKP
         kzbQl6TbL5rvP8BULhQo4jZKMTnEKrZhq3xRIOOzGrCTAYHTSeVuD+zzqTyZqZsWzwih
         tJyk2zK10hG61CeAd5TNMYEiKAfe+hObhMAw0cDkE5bzeSX6opBRBXLlR9IdAfUrYC5i
         PsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928482; x=1785533282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7+ZA28gDUEzj5iD4x7F6ajfXyIC1ya4ecZFfAjKLJk=;
        b=Oxq8IFiB6nI04AdjmxxozrJsXXkik7C9wSGunLznlXnCCU/keN+oqf8lBdPSJGX/Wr
         j6suNpOPPH8ZKKc9lNr6wccgrC3wPsQT+yfhJOvE8ceeTK1eXYxRjoZJzCP6qvGcJ1Nu
         zqLV6YvAvmevkIAiuZkz/iYcoBhpEqx9SeMTjwvrNAA/Yqn+ZNLXbSgHDnBPzVCXo9p3
         YoAWD7Yp3eDMtr6A0mWhhZdeX2a/Pcijwwa0hnuRaof8D+LLqdjy1O+zWrV8scyO68HO
         fkeWmEbS8cdsw016I6jhZgGITG5luUyw/PxlCeiaZYy/UHLOBwpmc+GAnFnP6dKgSqin
         jSew==
X-Forwarded-Encrypted: i=1; AHgh+RqUHn16D0tDs8lgvRBhVLAj5zK/s41Ya8/NBfTtyOiBg3J6ZYej7mVIN7poEzx3vpmmL3QK1cBixv2rHkFQIx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vpWLdOQf7oqLekSfhZnfXbQ3O85Luuck2NK+i+mPHxSNAC/G
	cOfHlBa8OlhJyVlK6eiLff7HxYY17S6c5vYIk5MQVO7zHM/SlVGxyfqq
X-Gm-Gg: AR+sD13Eh6ST0uONt/zMGdv2UXpIHztSjKwdsKLZzvuV+pCK5K9/w/dJN91Ru5yXuDB
	dLSjZVEXQm4tq/XqkvTqLb9maqPYVWGyW0ic7g8SOeBOnNNXF49JdvkMHuGiqd4NlX0xbMFjyC0
	HSGFbMj5+p+/biAotTcsJo3CI7zuoZnMgmaLCnwlsYqCrhUQu9PVe06F6jNr4CJH8nC4j+wemGe
	5CKln+WH2KJl1KE9AfRPg3gMtFB+6zP1m4Y+CryqCSeORWJyN5SbHi7J907nIKBqp/nC59DlssQ
	75RdhLMagTIIKZSWx+zMiw1i1GrPAN9NRKQOBZxW6dHmwBAtaqOozZLA8pKQoLNu2GeukVA/o0V
	peuugU/ZDpdWuV6xzDjqvM/9yVLHMCBUeCuqYfITA+EjofP3r9/60JKjmz/EGTl9NkaE2XagOwL
	kifzlrDMb1EZwY6QJiM2l7lsYbbt+MUHv1AtcIITC4pr4UVzd1AKQPEKuE4D2Ae0RLSSlDiOk4T
	wvDLIv3R8BQpFsuLQxapjNWQkmZVw==
X-Received: by 2002:a05:600c:4eca:b0:492:1e4d:d44b with SMTP id 5b1f17b1804b1-496b5766ae7mr38005e9.8.1784928481824;
        Fri, 24 Jul 2026 14:28:01 -0700 (PDT)
Received: from [192.168.2.69] (dynamic-077-181-161-038.77.181.pool.telefonica.de. [77.181.161.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858e28sm18027135e9.2.2026.07.24.14.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 14:27:59 -0700 (PDT)
Message-ID: <cc09e554-45fa-4b75-8937-7da15432a886@gmail.com>
Date: Fri, 24 Jul 2026 23:27:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/4] net: hsr: add PRP interlink (RedBox)
 datapath and duplicate discard
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wsa+renesas@sang-engineering.com,
 jie.luo@oss.qualcomm.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, fmancera@suse.de, bigeasy@linutronix.de,
 fmaurer@redhat.com, luka.gejak@linux.dev
References: <20260717201457.54-2-xiexinet@gmail.com>
 <20260724131230.679892-1-horms@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
In-Reply-To: <20260724131230.679892-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 14:12:30 +0100 Simon Horman wrote:
> [Severity: High]
> ... does modifying the MAC header directly in hsr_xmit() corrupt
> shared packet data? [...]
> Should the skb be unshared before making these direct modifications?

I checked this against the v4 base and the series diff.

The shared-data write is real. hsr_xmit() writes
eth_hdr(skb)->h_source in place - the slave-address substitution
for master-originated frames, and the macaddress_redbox
substitution for the interlink port - on skbs that can be clones.
Multiple consumers can share the same packet data while needing
different source addresses: a PRP LAN broadcast or multicast can be
delivered to the master (source rewritten via
hsr_addr_subst_source()) and forwarded to the interlink (rewritten
to macaddress_redbox) from the same underlying buffer.

Two scope facts. This is pre-existing HSR RedBox code, present
since v6.11: hsr_xmit() itself is untouched by the series (patch
1/4's hsr_forward.c changes sit below it and do not modify its
body), and the series' only h_source-adjacent change moves an
existing ether_addr_copy() a few lines earlier in
hsr_dev_finalize(), where no skb is involved. But the series does
make the existing interlink path reachable for PRP.

I will handle this as an independent fix for the existing HSR/PRP
code, posted separately for net with its own Fixes: tag - not
folded into this feature series.

Would you like the feature series to wait for that fix, or may v4
proceed while it is reviewed separately?

(The hsr_create_tagged_frame() side question overlaps the third
finding in your 3/4 mail; it is answered there.)

--
Xin
