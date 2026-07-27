Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1315408022
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157187; cv=none; b=jdD3EEcYvhzmuB4RP6koBN/JiCpZHl7zJhMxeBhuxrj6za5tEBtXSB5oFVrOEP6BLQiA9iZCh28k+0ZEcuw/KWGOsPKVyJXOgR+LtjeYAW6u+UYfwVTKLHzqc28dyt6Pzf6UBfX6CnofpT9hUrTOx9WJtPEyDYy7PHWYbRE9shg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157187; c=relaxed/simple;
	bh=hFgTbWZ2T1eOWywSvxcDyVgVzbRIiGWe9YqxFXoTrn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOvbBXPG8sDwaz8tXSL3ZNunzKyhrMAjf8AnW7rk+lymJIdO3AU39TtcF3OZJWkr8jrvz/rocFR+SBZ8LasNVduMsqMWB95rc+RCjbVN7mxjjILoRoA5bL1/DQpAye7SDJ3p8y3u2TLov+KdUz6BW61KXZjHaxsg64h7cOCinp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdPf0kBQ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdPf0kBQ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso30188385ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785157182; x=1785761982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFgTbWZ2T1eOWywSvxcDyVgVzbRIiGWe9YqxFXoTrn8=;
        b=gdPf0kBQbg/UK700QJILbP9RrvrcGptZv4bQEPPAToKHbwBr2h3IXVN1DyAC4cz/7I
         AqEEBd9OXJMUd5if+xi+WMBOa4E0VjNcbrb7iHdlgjGqUhmHcOn5sQH2m2xmbySauPG6
         nFlNHQt6nZ86irVlT+3DIG7+qI3ioqG2oQPD8qcgEPF5154DnnRAesb6dxDKMjkp2xag
         HQOKDjDxW8L5LhJyhiGYUdEYdhaw+OOT6Qx7AseotOk97XbozAdxsVbzRqDqQ8ct0UbQ
         tEJrUUjniz1ZPyL6/JFmHUcQy6hL3rdy2CsDevtkCntPYOtoX26v7hBelbeT9e18Gthx
         WIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157182; x=1785761982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hFgTbWZ2T1eOWywSvxcDyVgVzbRIiGWe9YqxFXoTrn8=;
        b=aN2iZf0xrxEMV9we0MrTIUoyd4AEhMb1zrHF9QdrPG3wM2htiBBr7Gu8M3T0nuF6P+
         Cpx+yKW2TiAgJE6vh4ShMQ5IV11uclDav8Gk9jhL0QDQwUOYMdKg4Vy09TQ/SjDV3iB4
         bnOKZge+dnSlXUArg0BmKQd7n5g5qB8UON23/pGv6vYMFgD4+uqmf4t8M1+/W9uO7KKs
         9CmxZcQcMtGslwpfI63rXCLn/4avfbjqLVdyzypddX4WJ5VC/3fJkvBCxIVGirTaMnSc
         pK21W+oVTZnzho1NtnNE7947wPqa8cORnT/wv15nnVteA4hzl4lI+vl1fibRsIDezvpj
         w4KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8VXzLz90qPJ2+1KM56ULjhz/wuxdXg9dTU8utK1Ux/XpVzmoG/AR8xjfqvhbay7tgUHPK4D88kY/v5IdDtVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEFM2q1jFHf4RmQzuc4PRyPKSJRimaAjoHGKIJvz+90JN/I2y
	YQqSTU/wPyQvMivV7AlH6Ol+WQP9wuD+dUvD6yoqoTi4VQ2gArjDTNeQ
X-Gm-Gg: AR+sD13JBuc4putuhE42Pi6bHxrbBEcvFjfIf/C1hZhdLbqAERoKTEhby/vbxBsi0D5
	zIq+H5l1OSJBi/Vpqnv0NasDFKz0JM+Srp9TfjkrpZDA7BfP8uBtosxKs2bCZ5EK5oswbfg1qlR
	AtsgAqR522BDx4gIVqBiBPbzCh0oAiTFTmmphFE11TmcnX7fuIQfThGqUWlMuhQetwTG9zA6urR
	YLDq4vEMeLSlqUzMI71ylQKKAHbdhCv5t6gsFayPKAzOvmTGRNMXGShVGN6EgdBoRqnj0A+3zzV
	uKy6bS1a5MihsfdukcE9+IeEdpB3ath6VRREY+0xwcCoHCcTfidiyfWq6N/kvPE5SrRIeBtV6LX
	QEs+wDvwl5JieESusCtAe1SCfJuBXFOsanEhm3RB1vFl1TlYE9JYA8eQpBIssNS6AZI071MUKJf
	buRaN53yRBn+kmTjINLJMIeSmB/547loGqXLBp33s48Ym207w=
X-Received: by 2002:a17:902:c943:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2d0089fbaccmr6098045ad.20.1785157182069;
        Mon, 27 Jul 2026 05:59:42 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7ee3b1sm34404955ad.62.2026.07.27.05.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:59:41 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: Re: [PATCH net 1/2] tls: don't over-fill the plaintext sk_msg ring in tls_sw_sendmsg_splice()
Date: Mon, 27 Jul 2026 21:58:04 +0900
Message-ID: <20260727125804.2889161-1-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <amczWCEaLMVQWZp8@krikkit>
References: <amczWCEaLMVQWZp8@krikkit>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2026-07-27, 12:30:48 +0200, Sabrina Dubroca wrote:
> This should never happen. We need to fix whatever path leads to that
> invalid condition.

Your diff is right. Tested on net (53658c6f3682), stock config: without it
the test in 2/2 oopses in the AEAD walk, with it applied there is no oops
and no regression in the tls selftests.

Agreed, my patch was treating the symptom.

Sorry about the verbosity of v1.

Happy to send a v2 with your diff if you'd like me to carry it, or leave
it to you. Should Fixes: stay at fe1e81d4f73b?

Thanks,
chanyoung
