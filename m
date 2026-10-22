Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682399;
	b=VcfIVuflR1j490en/+2dNc6fwr94yaFW9xh/dy2aQwUbuCmSLs0lLkt4B3+dwbOeQKMk
	 wABDncTiCrvMdfEPPZBNOcK2cN8zmoRNSFGva7x/M2jaJcqmUrHYEIRVLfLfOCwnvWQP0
	 Otqj72j28cX3RSWrCbHPZYhHCWZuIMMnHcKOSItmLPpOaWUzjEGQ1CjQosDq5OeBt3XI6
	 zjSEwJhSqHhZWho5OnUmClCuEdB/UT4o6YaZoHT22pZZbbbXGpeL9/z98S4uGONQNZ57k
	 OvKcRss8+kdhXtBRkt/B5Ct45NSv9BBDxCoCaxnQHpEjGVv4oqCPovqV7iRzG7rmUug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BnrGb+jh61PMEN1A1ot9ztMiZjRmoi86+DfRlEdShv8=;
	b=myVTmlR+QJU0Amqql08KfZ2V6DqFLgS8HR9EZS25alBxqYwh5t7ge0tIhJ6NX0QD7Qh9
	 UuCqJkUG4FXlgCLVQ0WlnbtIy61tK4pKpTA0+v/cx5ERhj690n0lz1TTUmyOpuu0m5wh0
	 y0FNMG6csO6oQi5MNuyyOo+XINlCRrv9OR922WREZIJqYZZv4tYRz3N4Kaju4Sj4QvwDV
	 LvVlLsVSDlZXQWysvihOmrpOiL1UN276Y48nK8yw//VPIiu38E5/wUtNSXeGOVYusPMkF
	 DCdibFMMV57msiBHLn+hhrrUz2Th07Zu8TyR6MoZZdST8EfmBIIxFPGpibf4Cr0z6VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGo3sWyD;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD35606ACCF
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD35606ACCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UGo3sWyD
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so568072241.2
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682398; x=1793287198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BnrGb+jh61PMEN1A1ot9ztMiZjRmoi86+DfRlEdShv8=;
        b=UGo3sWyDPsmJGz5uiFj1jATefs6I8baOo4CdN5OOqaS2lnhSCS4q9Nh48633sePedo
         8yZUX8MHrBCHZbIiwZLHOeDGZhOMUwuiN2cOSdZCcHecU4YcoMgEFojk9xBmS22ocEDc
         VouDirwRRkx9nKyKuEdyCoiOb6Ra7mVtyfIXEgdECFSfdWO0Y50mf/4ex6uyfecOfCaH
         Vj5y3jVHqY+CLi3tEvClmRodsbiu1bebCp0/KNDDKBrtkwT6r40disEYaJr1yURTUQ3L
         tWOIlQCeAthkeLE/sN05iTgAX7omusfraSySvsyY+dyxVOQ8tpgrsLFP8q25WJQS3VW9
         +Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682398; x=1793287198;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnrGb+jh61PMEN1A1ot9ztMiZjRmoi86+DfRlEdShv8=;
        b=FWlCZsm8d440IntNR/2tgJN2USK9OQF7yy23od8DIwwY2XVo4jfWKZX8PYdUCiiMFO
         aVagc2awTtu7KOnJQq+k6huvTWdAslPB8XNe5udptJ1SzOPsGH+H2VJDehk+meJUj4hE
         qn9ecOz3591x5XXpROE1gmbWLoCcGUCQ+egogAIImL8SxFKqVcA/8NchW/fY97/Pq1x7
         +b32OIickXB2UpDZIOO4l5O5LnBowV8imgZcw8MBMEAOZb0G7SqTPr1YSVkIJ/v58Yg+
         jlA+5YIXsYv2RkFlcPsgAqXXAvE3lXYeFOeebtmvkF9GHJ+G/WX2w9UcfHvLblosiQAD
         OjOA==
X-Forwarded-Encrypted: i=1; AKwUvBwMYolDwOi54bo8pnA9qpYRREdJa/HUSrGUjUI4iMuTdwS7TUn2KdPZff8vcSPdkpLuYflIbgVvQE9YtYokrXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRv5szAoypuYwcNq2VEDy/BFH65qbVK/83d/Uz0kDagBOMzFWX
	u88gdjsRInOQ7ibv2y/2GZSBMCyBn+DBc6EiuqhljlHVbYb7X7q3fmK+
X-Gm-Gg: AYBFou3zGx9Mp5ljkC5JFbs0d0gWaCcDHgoRSsPkd2pg6K8lmlYPQ5RBa0C5Rs7Dvxo
	0CtynYIIjp0B3COcGiOBEYQqRbT2A918NbrX0nJyvOo3UZllK85KCtG6MxwHId2fW1BpDWeCSS7
	mWAYi2gLSPP2+wkI9Bb+oEtD2JXf6Z7nSzGYo1BteZ97Wit038sfdDKoYs9+rO7l2RUG6xbjo3V
	JE6swqwGpOMwmMiR23tdtCmgPaEh64wnQ/glIewyvrsqiqjsxK2VmNygIPHlsC4oBEyumHjYSSc
	LTa9rKZaQSU88ce3FHkOrO6hHigZMhEa+El+mq8eppduojfK3CLP0cfvNyFEGnHixr2C3P7nZb3
	GnSrOM8vM/4N+QsBvzFdCAjPhFHAvsY4Nx6mTzAuYsNPIFsSIMDzStCr96gY47NJxMPQBn/stRA
	UT0dGK9wuYpLYEQhafOktEhihV3jHxVTti/ZgSuQgKxYg6EzBZym4qtDJwd4JSpEJ046AnmkEyG
	s9/d0MuNRUsnuvW8s3H0ab/U7w+9eG4vWNl35DO1OyQz8rlYNrKKBhcEffBEouq7lreR8+WiOCN
	fteJk4/jycdSS9FJgZxsv/Z4Lvz1WeISsLrhdhDAJkqdVIlvvRn7gAY+uwF1DJYHLWGLKhIo9xO
	oXkZlywMCoF01g+wZV0U=
X-Received: by 2002:a05:6102:160e:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7cc9276a1f7mr1817213137.36.1792682397951;
        Thu, 22 Oct 2026 08:19:57 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc9237bbf7sm6580982137.6.2026.10.22.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:19:57 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:19:56 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Todd Freed <toddfreed@meta.com>, 
 netdev@vger.kernel.org, 
 toddfreed@meta.com
Cc: Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Rahul Rameshbabu <rrameshbabu@nvidia.com>, 
 Raed Salem <raeds@nvidia.com>, 
 Cosmin Ratiu <cratiu@nvidia.com>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.31749cef483da@gmail.com>
In-Reply-To: <20261021210200.788191-1-toddfreed@meta.com>
References: <20261021210200.788191-1-toddfreed@meta.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Todd Freed wrote:
> While working on adding support for socket-less psp associations, I
> noticed that this case was not being handled correctly. It will be more
> relevant with that series, because it adds udp support, for which the
> psp nexthdr will be taken from the inner packet.

Just curious: what is the plan for replay protection for UDP?

As PSP depends on the inner L4 for replay protection today.

FWIW agreed on the ext_hdr conclusion in this thread.

