Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666143A7E9
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 07:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311412; cv=none; b=aizdxNgyCsaDci8y4LoRSEdGxguvXrGh/u8UnC25BdWPr1o2Z7KYneJMPMQL3Iwe6X2aSxp7oZ3cpNNpHBdfVbzzoMwwVlTgwfQ3rUice+5OUwzpJ63nP0wrl+vedieWAG4wFK0ewC2FluJFhI7W6vsIoxk5NfZMwLK/qDX3BX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311412; c=relaxed/simple;
	bh=28GhqlBebqOgho+tdi21xI5zxR0h+n1Zl46jPz5s4zM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=kCG0Hpb0+6L8NtodR21tasaN7dl5OUNOWdrfuJFzaGKclHVCZkjh1TvMP0kij+MW3dGgp00jBT9Gw5H7oZ5afyXDHZBPoNYMtrfBOL3xQCukIA2r33rWAMp8wfqzvXHEj2CDbGGDCSMuLPso/IVHMcAZot67g0usgt86gvT8ANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E23/wyEv; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E23/wyEv"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664ce3000e6so548929d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311399; x=1785916199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIaoLBAJi14aziVF/VtvuHHQDHZL9QF1j5daqFTSzrs=;
        b=E23/wyEveEXu16BNf7EsqJONZ5wV/9yTTl6CdkMYSLuUKkCRjH3fyqyszv07Tj5JPt
         LHYmMtcwy9OKI1yiiK4fy4G4xnr5ioKpLkV57ei6ZT8P5RHrOklMMofKqv2tPvGbA3Rc
         y7mb7adQf2fnguKQg9HT/HzEATua69+oZn9PpbfSEa83uDAin/5ZpxoNkNmJgNk1o+9G
         8UsMgFgDUJKESlasEF8E53WIewfVqVSZ//WowjOfT3JQVZYdyKreflqlAkdE1QYdw8T1
         VchSV42GbxCR/BOBOVCiM2BnQzfUSGpuS8DSB1sfwqUlqnYZXAggVfeDJz0ZDVNfpFD2
         HXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311399; x=1785916199;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIaoLBAJi14aziVF/VtvuHHQDHZL9QF1j5daqFTSzrs=;
        b=tZezKLfHYpm5XGrSGI5GgZoz5WqCl9FrEUeZ6vUdePfMZIHYQ3zliOMZJ2cnPT1UM4
         6gshOnO67KXOag0tLUjJAqgmQ4l4SxbloEH3bG/HdyhkGGg4Pb6yi5v6rs4amn9VkNOE
         Golwzntqrq9f5xK8jqbLdgNnpgOxtC+ETRxjTlqMC+q0ryrfa+WZ/IN70VDgGIezfu3x
         x6JAJoWO+hMIuA3oU+jXFKKorJZPeY75mxaYbmD/ifZnfCDnkic5Hwjc0tFDCpU4Bhrx
         uhPID2nAGTucg42IM3MSHkjyptbsjGTUnGUWPXVofkflvYmCVzv2w42dQ+lIs4UIbgvh
         WqsA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3zWQ+m0KXb4+KtQ4O2eAig/iUK2ezYZArFfTOsT7DaNdeXB9Cc5nZO08ZBIXPqhkNl0IlOthGuxn/a0zy5zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhodZpzzvOTXwJrfLzM9onTTG8inLG8znKQJe5sqVppsyt5WWW
	M0S8+ncYkfKeeprsM2dYjhSP3koJnTmV6skw15NwbJE8j89hoZNz+gVI
X-Gm-Gg: AR+sD10XgWl+kQVOMv2a9C+/CWogZKL7eeV9ZgKq4WggV7Bd2kp5V3rPD+MeRygm6Ye
	vb+K+1aKymBJ0r8nN3KeyYdGSd+L/pJ1RlXXbL6ADPbfSqlFTIpIqmvTdjQdzo23NZbdmXdPSvo
	Ly1dlzZflCAMEL/Us6g+FGoerCZSakxeMmiTcAJBL/qv/qc7j2n/9oHwlAxeXhPqma54ijgd+lf
	OoKqPPh7BX1yCcAQG/Q6Jq83SkoEentF5ukt5qjClxKcuw0qj96+r+4SpdGyjAs+uRZL8tH0pnM
	TBUiM9I0asB6Ju98xG9bSl7jN1lo9HiNIHmDXpv5QhYjSDr7jj4DrUL0TzcH0KX0JoHFIDMA+jm
	6k8B32rkJOfHc4iSqU8gh9fqXjjOWTtoSfhBZrzq7wiWhNG8M7Y9Wwpg79R9rfU0WSRtz2XC2to
	xJ4i7U2HcSM4HhAE8uKaNsDA/61DBqLJsH9XTWw6+OP3CJv52UX27TZJtnVbJyiDGsQpY3fbUAc
	UspwJGKffaSa4dGfO1lP1VHB07b41SVZCGT+ySj6MXsUsM=
X-Received: by 2002:a05:690e:2513:20b0:667:c39b:5466 with SMTP id 956f58d0204a3-669057e15c4mr1988022d50.63.1785311398738;
        Wed, 29 Jul 2026 00:49:58 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66912662711sm1379263d50.20.2026.07.29.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:49:58 -0700 (PDT)
Date: Wed, 29 Jul 2026 03:49:57 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org, 
 Joe Damato <joe@dama.to>, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.345fb70d551@gmail.com>
In-Reply-To: <20260728160935.4128982-3-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
 <20260728160935.4128982-3-joe@dama.to>
Subject: Re: [PATCH net-next 2/5] selftests/net: psock: Generalize stats check
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Generalize stats check code so that callers can specify the expected
> packets.
> 
> Signed-off-by: Joe Damato <joe@dama.to>

Reviewed-by: Willem de Bruijn <willemb@google.com>
