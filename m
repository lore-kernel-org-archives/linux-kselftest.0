Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727273BD22B
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453471; cv=none; b=pcKwsWGegpnyTW9fysqsciXNK1R0lcU/lpl9VOompdc8QWmvlmQRHyvqi3LgXXSNOvF13oIiLS1sURG44oo6kgWcY1UOU2rTkQdhbAk2zEbjnbvfm/oZyMerFTnPvHjlonKfpmNiUCPiqLt1c37QAMyZ44ikM+4lkpfnxrmLR/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453471; c=relaxed/simple;
	bh=qSb3SGcwsDkoHlK03XEymnt83+9LDsaxAxUN607t7f0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8DKysEkLWoQN6RIEyvCXL0XzeZVN5Sd/P1DWaYvCS1Hn7MaaE9AYFm5VIZBKBj0FK1qvZX00X4h9Dh929HnzWDc6pPgpOJD/aobVeKODLYHxirISwNhgRTfnn4eLLZsk6eSHHlKco0U0ZVROD9RCSIPi8w+7XWc60RNiZas8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=BW2o4e6U; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="BW2o4e6U"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso107392875e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777453468; x=1778058268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkrOQ/G+RJZornxNRPNTMjR8gIzBGAkvbEb+2nxyTLg=;
        b=BW2o4e6UfLPAWck8gz2OITAGDUhrsdTFJBacHejebF3U6qk+YQlr05SJoNP/HvCtAn
         sqNUHxaol/shN0b//ErMfRquzqvFPKIEP/53E1OkG59rCY+lEdYfAmnTgqm47VSCJHEW
         s4mbe79bTiOFuD/cQSXMN6s+gdwh11Ly6DyQC7kow+1oHZXBFAeoiOwiiIxN2OISXSj3
         AYPJIeedXgFUM+sdDLDu9OaWNp0LeRwPNBoZNpcVzpABEEsBXCz0fO/cN14EghTHaWm9
         D0BZnT1eg5Hns0U4oxZLcgqQdmka/11q5qCiV2RwOvS0JbjijI/8B0gDz2zJ2QVUeI5Z
         vdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453468; x=1778058268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkrOQ/G+RJZornxNRPNTMjR8gIzBGAkvbEb+2nxyTLg=;
        b=AXUo1YqL6MlxR3uhhv2asXRqJFsNYnXxRdFk+vOSAJC2rIJ+pxYHH0+3FgcckeqNKP
         nR5BXQ1jmasZ5NVCH34IaS6478ALmNpGgVPXMkLVx1C8L+MdRfHJr196yPwpi2Yezih7
         JTgqhSGOPZCkG4uZBt+6EXD5xDmufsupm3WCH1V80dSixD0eh1bes7XXmew+9yCbBjZo
         wLZMzjg7qjG4aD1aKh1gfnAUQ6pr5O+LEiCMtHVEAO/eSFU02p1rYzTfR7DYKT6JYMDl
         3H3OtTR1fVu6+W0VSfR8epwtlW+854c/NhTgzTMzgu9Iln5sDH1PmUdAjWyY1okNgrln
         PkTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9shbxVa8cI1rkpL4MRG4qeodLft6syOgweFEcOBlWGOCXRbwfnWolwbAHvc0PCJ/glgwTQt+sM2BA2qrECmPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+tGLnLZpQ7SyoRvvv67KvaoskluzOkaCpPBTPTg/JongU3hjA
	ci5jawF1L+OgULk/0zVISnzK9yePwLogNS6qUmog0iutxDWANdTRZsNtN96eRNUdEx4=
X-Gm-Gg: AeBDiesXiesnSdXLFga9/fS833UfQCZySnGNGnD2zBog8YtZb17hfHmUjSiGrSueOb/
	k7bMZ75pPQ86nfdKXBsFPOIl0QI9gy/lvJ/uYYUirDbCRqAMDwleSHY3YrZVQihgXIV3TMrRAZ2
	QBuHNR1l6L9jwUUJj6G+DVyeCk7yCRcCv0eizPAJdTT9WVcLWzGL/G3QwBevvi9FMm/j7dStvJx
	Xzu2J8/zcq8X+k8TIHsUNfDZ2ZVZ+Uo5iW0SVomxRSrRLi8chEn0D9mpfTcE+MOKdKw3mKJ8lH7
	GOHeHH309VPi4CUpJxQny8MG2FoqIunpHQlSIfirhldCylPoNB+RfaGGxddfc9te9yMmPWLdUQf
	646mMCiMnPvIhCUeOBHn7h7jNGheayAS5WhI60XIqL2KHPdRuQ2NHeaDvCx6iONSFPGG5Pax4dg
	MU8/VFj7kMUhlEbRxbaiHlhnnyLiWMZnfPTQRbmrkYzS4/0bLVYNKPIXabieCT61WC
X-Received: by 2002:a05:600c:4645:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-48a7aad4537mr42583695e9.3.1777453467792;
        Wed, 29 Apr 2026 02:04:27 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2d3811sm20967725e9.3.2026.04.29.02.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:04:26 -0700 (PDT)
Message-ID: <efa4eaf9-0c5f-4cea-ad9d-dd1052ccab76@blackwall.org>
Date: Wed, 29 Apr 2026 12:04:25 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] selftests: net: Add tests for ARP probe and
 DAD NS handling
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: idosch@nvidia.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 bridge@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260429062405.1386417-1-danieller@nvidia.com>
 <20260429062405.1386417-3-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260429062405.1386417-3-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 09:24, Danielle Ratson wrote:
> Add test cases to verify that ARP probes and DAD Neighbor Solicitations
> are handled correctly by the bridge neighbor suppression feature.
> 
> When neighbor suppression is enabled on a bridge VXLAN port, the bridge
> should reply to ARP/NS messages on behalf of remote hosts when both FDB
> and neighbor entries exist, and the answer is known. However, when
> either the FDB or the neighbor exists, ARP probes / DAD NS should be
> treated like regular ARP requests / NS and flood to VXLAN.
> 
> Add two new test functions:
> 
> neigh_suppress_arp_probe(): Tests ARP probe handling by triggering
> duplicate address detection using arping -D. Verifies that probes are
> flooded when the bridge doesn't know the answer, and suppressed when FDB
> and neighbor entries exist.
> 
> neigh_suppress_dad_ns(): Tests DAD NS handling by constructing DAD NS
> packets using mausezahn and verifies correct flooding/suppression
> behavior.
> 
> Before the previous patch:
> 
> $ ./test_bridge_neigh_suppress.sh -t "neigh_suppress_arp_probe neigh_suppress_dad_ns"
> 
> Per-port ARP probe suppression
> ------------------------------
> TEST: ARP probe suppression                                         [ OK ]
> TEST: "neigh_suppress" is on                                        [ OK ]
> TEST: ARP probe suppression                                         [FAIL]
> TEST: FDB and neighbor entry installation                           [ OK ]
> TEST: arping                                                        [FAIL]
> TEST: ARP probe suppression                                         [FAIL]
> TEST: neighbor removal                                              [ OK ]
> TEST: ARP probe suppression                                         [FAIL]
> TEST: "neigh_suppress" is off                                       [ OK ]
> TEST: ARP probe suppression                                         [FAIL]
> 
> Per-port DAD NS suppression
> ---------------------------
> TEST: DAD NS suppression                                            [ OK ]
> TEST: "neigh_suppress" is on                                        [ OK ]
> TEST: DAD NS suppression                                            [FAIL]
> TEST: FDB and neighbor entry installation                           [ OK ]
> TEST: DAD NS suppression                                            [FAIL]
> TEST: neighbor removal                                              [ OK ]
> TEST: DAD NS suppression                                            [FAIL]
> TEST: DAD NS proxy NA reply                                         [FAIL]
> TEST: "neigh_suppress" is off                                       [ OK ]
> TEST: DAD NS suppression                                            [FAIL]
> 
> Tests passed:   10
> Tests failed:   10
> 
> After the previous patch:
> 
> $ ./test_bridge_neigh_suppress.sh -t "neigh_suppress_arp_probe neigh_suppress_dad_ns"
> 
> Per-port ARP probe suppression
> ------------------------------
> TEST: ARP probe suppression                                         [ OK ]
> TEST: "neigh_suppress" is on                                        [ OK ]
> TEST: ARP probe suppression                                         [ OK ]
> TEST: FDB and neighbor entry installation                           [ OK ]
> TEST: arping                                                        [ OK ]
> TEST: ARP probe suppression                                         [ OK ]
> TEST: neighbor removal                                              [ OK ]
> TEST: ARP probe suppression                                         [ OK ]
> TEST: "neigh_suppress" is off                                       [ OK ]
> TEST: ARP probe suppression                                         [ OK ]
> 
> Per-port DAD NS suppression
> ---------------------------
> TEST: DAD NS suppression                                            [ OK ]
> TEST: "neigh_suppress" is on                                        [ OK ]
> TEST: DAD NS suppression                                            [ OK ]
> TEST: FDB and neighbor entry installation                           [ OK ]
> TEST: DAD NS suppression                                            [ OK ]
> TEST: neighbor removal                                              [ OK ]
> TEST: DAD NS suppression                                            [ OK ]
> TEST: DAD NS proxy NA reply                                         [ OK ]
> TEST: "neigh_suppress" is off                                       [ OK ]
> TEST: DAD NS suppression                                            [ OK ]
> 
> Tests passed:  20
> Tests failed:   0
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> ---
>   .../net/test_bridge_neigh_suppress.sh         | 126 ++++++++++++++++++
>   1 file changed, 126 insertions(+)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

