Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D91F4180
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775608728; cv=none; b=UW9b7XmObn015IbOG7a1el3C1aGwBpAlf8ZeiGpNe6XFG7b662ofjyOufkVg/+h8GpczGs9tw+Mz9QPaFd+ah9+k7lAhKctQMpodkKYHBiEoxFF/LIQBIxPrb5EGLmcUvgDoF389wwQosdCXqSchu0IPgqEzBkBlsjgpGcKHJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775608728; c=relaxed/simple;
	bh=XlSstnNTPTnbAPf7CszFu+uuopPUOk217z4nC0YmvSY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=EHRixuSpoij5hp5icpDN/rhtP6ES0N1LVDdW8mi/iTyy9LJ2R+RyCleu90eqCrmXPVEajtNALJqVyv/o8PXrthNDoLnT4eDWMugNboSVvdRXMHHTWm7QO4DQo8VzQRj8795nj4U2iFwam5BOnzYbmIZ9eBbW1unfQPQNDYsQxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOwmv8bM; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOwmv8bM"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79ab5fd969aso57673527b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775608726; x=1776213526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/Y8ALG36XOvbL7464wJlGy71Gu6GunBo4ycY6okTs4=;
        b=HOwmv8bMUPhHDVpURf4/sp1UAJLqs9IEk34wxXvBammRxrPrDKbvPDRLOfFxcj78uS
         jUB0VpQOyokC3O4LYq/jwBwB8skTUH9uxFMpJmuUMCyRurJiM4BPVQwVyIccf30rFSGK
         EHmwGgTA/9TYrR+MEmwnq/lm5wqG9XCsgwdHJ78gYYf17gnNwOlL9zPQvnAiLQ84vqpR
         4FBnFyozvulY0ToSrRM9/fCOqcjpZH7vNfmVTJNegwuP55EcxXjcm+wvbP5xwUBRILIf
         6SZLv4SbTSBldRs3MGB4XGe/dDQZfqj0lBmqgLU0LFoP8Zihw61cDZdRgX0RDVYZg7Cz
         rs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775608726; x=1776213526;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/Y8ALG36XOvbL7464wJlGy71Gu6GunBo4ycY6okTs4=;
        b=bcZnO9DvjWkn44wgJzmj4AuF7647998a8P6qpg9vfcfo2MaHJ60mhbH5oy6YWtQlRE
         Dmcozm2J1FMcXeD5lmubF8IDu54brRPNCcHMsvNqzkxXeaM5k4AWQNTaqSBSsN8IjVMe
         EojHkdRIdCuozq2EA5dwEmh41y3NEyMzj780VxoS6gm7Cvkz3ktD9Odrw4CK74/PDFMN
         cO3fvMHIpjGizOxTnb0HblK4AfoRik/BHi3PAMmTOZxv6HD/5jCsDbAIQWgjfmHUmaIY
         5HJ65gzyKeVNu11iRrzsjC49b94OyrdKpR9Td820lAMgnI3a2hleQES036mqfJD08CXi
         j7vw==
X-Forwarded-Encrypted: i=1; AJvYcCVnlvz7dSPUCjyy+DpnGGS73n50fM7m/t5ZIQsAzyBGgfvmjxqq2lrDVzZCJrkqNDV3foytuE2NuogaF17XO1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMBO/MFpnSO8zXtIdVCJuAIhrZk9B/lBCS3JdrB57CDBjQjksC
	PJfNhfzgcDIhugLVzookS2mQT8Ff9rTVfWHXC0zDxos9AFHxWUzWh6HW
X-Gm-Gg: AeBDieslJRG8QKW6rQ2FMXtSpq6i9oQV3Dsskpjgb9PDvjjTsYYH7ZMz2+88s27bzJU
	jxGq9XovQRvfy/0CT/ndq6wA5sPgAPhawjc+lNi0wDATUlZLeh7e39huy8JujafypXR+QDxmSLj
	BMTvQYUZVhxCaI+bQcIBAIRWVi6n9be5Kg3XoRci0Tsapt72s8TUhZNOetFIQYW08pMXlu3ri3R
	t+/DCvYaMk/fVi3DnQYaI4RsEpAUVk+ucWtKWAgufVx0FEDs1vi1ZfM9CVfWDk0rFYv1PzF0jDJ
	3T9xJ3qTHalLuXgPw5bavReyPQN/zOX1TiQ7OShk7rgYYoJ/3Gy6Io6aDBfoaEqv3ASHOULUe9S
	zCAxxPK7QGN8VbgZkja0Sa6aEkkKoTS6QZVCZD6xKr5so32cVgj55Nkf4QVIEHnPX3aXrZZGsaf
	YhcjmbtAX4H2zoAd/fvK7YmVtraJb9qXUY16OIphrP4DvTC1TazlT3+WxAvxT605NiEC84VUb9q
	9d3
X-Received: by 2002:a05:690c:c4fa:b0:79b:deb2:f5d1 with SMTP id 00721157ae682-7a4d644733bmr189144697b3.51.1775608725829;
        Tue, 07 Apr 2026 17:38:45 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e228f75sm76487797b3.10.2026.04.07.17.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:38:45 -0700 (PDT)
Date: Tue, 07 Apr 2026 20:38:44 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 shuah@kernel.org, 
 petrm@nvidia.com, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.334c641c131e5@gmail.com>
In-Reply-To: <20260407151715.3800579-1-kuba@kernel.org>
References: <20260407151715.3800579-1-kuba@kernel.org>
Subject: Re: [PATCH net-next] selftests: net: py: add test case filtering and
 listing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> When developing new test cases and reproducing failures in
> existing ones we currently have to run the entire test which
> can take minutes to finish.
> 
> Add command line options for test selection, modeled after
> kselftest_harness.h:
> 
>   -l       list tests (all or filtered)
>   -t name  include test
>   -T name  exclude test
> 
> Since we don't have as clean separation into fixture / variant /
> test as kselftest_harness this is not really a 1 to 1 match.
> We have to lean on glob patterns instead.
> 
> Like in kselftest_harness filters are evaluated in order, first
> match wins. If only exclusions are specified everything else is
> included and vice versa.
> 
> Glob patterns (*, ?, [) are supported in addition to exact
> matching.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
