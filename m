Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE214BA1E7
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487656; cv=none; b=Vx8516sPnYC5hT5d/NqKnfCY/jKt/5d35yWG5cPCcEcNedQRZyGZsDs6ppJ6AjTYMV+G7Pjl7LvJ1hbrumA9eijrVbASVwNostjoi39PdIo3FBA8H1ZgOFkTDTHP6CWzY2KkaE5GZXYSDgrmDRJp/MyNpZvcvmSFwsMT4oJJzAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487656; c=relaxed/simple;
	bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=osBxwW8+IWKKcjsUbw2GGSLipInS+d955FytLGxQdSyyFD1v2oPIjbcZKmHydxIkfUg70ttI/UKOBuQYGAv3fXczMc7gCcjYG28dehWzL0I5RVBxNWkpERYZkfO5MpuQ/rW3IqVLHuFBQbsCW2xFJhxaGsJtA0NiyeqN4W+f3zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP4UWICh; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP4UWICh"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so371244a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789487653; x=1790092453; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
        b=LP4UWIChu3Aw58AeZLJcsAWjCJWB5juhvCA7uZeXjAqx8cT5uoHB3LDLrEYohL3pHK
         jOJdkStYie7Vm7U4r38s30BaSAeSqFJEGFwYc+WNrZ4papZ3yge9eyI2U2EdkjTkKKo3
         VmSXPqiVUEnXauA0EkdawUbvNNygFk6m/TLQvdo4xSHdTDfMYTWr/hgBJxYcgnnjRUHW
         JoGnXSqm4SRLXzfaAQBqaWRtGW0OyQAvG26cP6DNKhMrdN15Wn1ZqFvCsgSYLWIC3gG4
         IpOdq5+rvsQQ+R572kzT7guNyYGO9iDmrqOKl64c8JReAoa9DtJEkOXMltClyqirnMUM
         NuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487653; x=1790092453;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJnhaZcB5kMb3f5fzObUYGBa4/RGju3f+hxU/7+kYsU=;
        b=WPSEsvzgLTqWB5cqQVe4qT4a5yO3rmNy+yrT7o/FiKiOiNAm+taUi4hYGzI4QVurrU
         +UPAPStz5rBjD0knZSX9aS+ai/VeRuaK4RWm0IdHXMhAU11z6p4jS2OdK8GA3pvYYCWW
         sXR7eHF2l+fH4Mcysa+i/0o9gMAr1uKr1wyzBDkrsrBomRd9NgoggryswxcHUB43vEz1
         xANFWRTXPDiLtw7tbQxGXUwlA/Fv5InZnNc21tAVvtdd1sllo0DYB+SiTZFyXCyl6jfp
         4/KgipLh1a6j4DH23CehAQHzyGc021SuOl5kly0hd29VTM76itKFK5iS13n5QZYVlbyg
         85xA==
X-Forwarded-Encrypted: i=1; AKwUvBxH8FBvst+UfJ9DMYACcc8MSbSUslZLKl/mKbbT2QZ6ujbwCUwBWQ+2WJydjMwobiqk7+v+x+ObVwn7uBFnQok=@vger.kernel.org
X-Gm-Message-State: AFuF++kNiCnm6hOs4xdbDnk3rdoE4xtuMIJSBmd9zhdFAdGvvsffxM/K
	sJ+f4WclFJafqXJ3VF5/cT3FrRQqzz5WolDpLaF+EjiTjokte/la6Lilpjy6sbrT
X-Gm-Gg: AYBFou0JXebpVS16YEK8XRr3Y8QLv07ae8xkUE4wEsCrDC/oyytlRSznpEY7Fhi8AW6
	JVRal5Xfga+8HD7NnAPakkxFGTTG5dHiRapZOxGwQ4xEeXrrk7iXqgRYzzgU7fG0l1tPtzNeceu
	dozlQTl1+NNz6IK4eFcwfP61lhJY3dJkOtCb6EVSrUCfkR5pfFrpffpO0Pc1SpZ0dgLbHerN4cQ
	4C4vA4y5YEncf+2ABRSS7RTnuEYWl/c84PQ0Q+jtfj75R8X152YqWh6sOMMZhp3dj+ykgsEBZPg
	jz5SDQ2+pRRyUFIMaUucE8G93ed6EcVPsfB2Y6sKH95GZaNJM/OWV64RE3nRfrZb8zeNtwxHWkH
	9RorGZnbY3oqcg5no0YiOBUw28vPleGiX4LlDs5yFXHcamj38OZJYGCZUNL0kjxWKFTTb/3goaA
	E2v5J1JwF3xIjjOdlE5sUk/lfB52NTOC0MGV2vGg996Xf8mm1lpQaGuCe3pXaBm9O6zrc7osZJI
	cLtJwN8BZMAv8JK/rHIdg1qcg==
X-Received: by 2002:a17:90b:4a8f:b0:39d:f254:4173 with SMTP id 98e67ed59e1d1-39e110dc85cmr2590678a91.21.1789487653470;
        Tue, 15 Sep 2026 08:54:13 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm6012249a91.15.2026.09.15.08.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Sep 2026 15:54:11 +0000
Message-Id: <DLG0FI0V6C4U.8PPNEKEU8LBU@gmail.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "David Ahern"
 <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Cc: "Simon Horman" <horms@kernel.org>, <netdev@vger.kernel.org>, "Arun Ajith
 S" <aajith@arista.com>, "Roopa Prabhu" <roopa@nvidia.com>, "Jaehee Park"
 <jhpark1013@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexander Aring" <alex.aring@gmail.com>,
 <linux-wpan@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/2] ipv6: update NUD_FAILED neighbors from
 NA messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1789448374.git.lfqlee314@gmail.com>
 <4169629e-74c1-4a21-a187-6c65d70502fa@infradead.org>
In-Reply-To: <4169629e-74c1-4a21-a187-6c65d70502fa@infradead.org>

On Tue Sep 15, 2026 at 5:26 AM UTC, Randy Dunlap wrote:
>
>
> On 9/14/26 10:01 PM, Lawrence Lee wrote:
> > Testing:
> > - x86_64 current-config and allyesconfig builds with W=3D1
>
> What does current-config mean?
>
Accidentally forgot to reply-all when responding to Randy before,=20
copying my original reply here:

That's referring to my local .config build options. It's essentially=20
just the defconfig target but with VETH and Overlay FS enabled. Sorry=20
for the confusion.

