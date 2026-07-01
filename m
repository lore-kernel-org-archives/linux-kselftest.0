Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2C3A4F30
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942682; cv=none; b=Sj7m6zWQLrCFSNtg/9FsflA3CVPMKJnOK/Gv4EzalbRG93zEzRe1Rm+X/ys6vq1akGVVp2gFPSJWm1K2xcFy5X/i4nIHMyIrrJmbl6nO1HitSlh0C1J+h8MbepUVVS9TBdfCa8Et7fgdkjG6DJMawr+CkD4CiBR+YVOpYm9s+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942682; c=relaxed/simple;
	bh=0k/L4mrFt2XqSGLGWZRN3iV90KhxUQkGyJHmQilQFfk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=gMKrvw8dS1az48j/mZpJIezeKnK1OdLp56D5+6Ct0Wp7Ka1dDK8pCL6UnlhigR2r6sDkqixJ6sd8/LexX3F1UZ6BOWx0rKnu9hZm7kM8ySG9bgRGna5gUiLcMXPbOawQNgiM7LP3huVSmzG9BI8dpjPh7vc9KZsX47QTGoRSUu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDKlw19a; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDKlw19a"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664b05d408bso1075422d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782942680; x=1783547480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T74aVSqrgVA8muoQOluLCkwY8h43e3yrgKZJcJIZZc0=;
        b=eDKlw19aVak72Hkp4BTVMsZ2duQ2qsd+SXnjIzCEgYkcqw8qyxG5AoKNpyA2lPIQbK
         dpnYs2Qp+DI3s7Wug5sZMSdZz3PieVKERc2VgbRqUJeqBcpwlpG/dfgOKXS3w15nQsxx
         Dz0RSUfTVRF18+xljta/g66RQ5UVjn7axZp6bcFH6nCq7KzifNgb3gWzodd0m9SiRx9O
         Rp9wvu/1FOMX1ZtOb7qoVbQJ5dt6IllkNWat3eBXb0BFCMPGre9/FvIwjbKq0A6/tGEz
         6da1WWyn7mwQi//Sf4qaKX/ldbJOvfHyyv+iZ9B5RghWG8UDiaPD5DDiXNOTFR0P153Z
         5XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942680; x=1783547480;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T74aVSqrgVA8muoQOluLCkwY8h43e3yrgKZJcJIZZc0=;
        b=ff8LmaoR6OFLh3zi5RvhkihmzUcizdTNaoLrPRNYPbatt9+l4bz064psa+BvYjMO2h
         asS3lDBQJZhL/OFcuOh0YaUx0Ho5aAVKVLgH+PUop1DkH4luqbcDpMhoUUg3rHlb56I9
         O2AWXUCaU+SmwXKPV6VvFJdqkj8gAX9APE+4xjzlLSB+5viG1WQqz6uXBfoEshLVf727
         GzZo6v5a3smT+aln1iUSFh3eQfzB2FshRefYyz0Tl/vXEaNYBJgqRgrEy7JU2+libY8g
         SQD2SUQ4+PLavoWP2Qt0TaTW4gmC/A8gn292YVsVEbzWakMAmcxpjR6urXqjljwP300f
         pugQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqoo6cC7NnGf9q71t19+602yl96+Cuj4vEVvQWalAT6JG9c9+POSDz6mmk6qlkjdOygkfbYc+G6f5CuK5RDVA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqsG97+jln9Hj3XQquqI3vR+iXlbUaSrNka3ff/6ZOpRvBu17
	gnMAEPJo1xHgXY0/hTUuvS+BT4twVKWNTyAT+gaBU7OvLWFtKWH+XSbZ
X-Gm-Gg: AfdE7cnQvQV+2YsnJn5M94F17UaiKlhcnmFQNdWb+KU0UsMvMVcw7kvi0mIrnSs0T7K
	EIEdjfZFetRUfKb9JPR15fZpq8ldz/G+N+bIfhCmllP0lYAbh10oum1Hk+/LaOgTMZs060D6wuO
	4pgkQBpBoRW04p+sKDIAFLMue/7WjN9vYtF6Myzy3i70Ujvp7MSb+XocMSkh0yh/wN3EZq6+fuk
	TrJVClHrPmNw5o3Vb+YNgO+FecQ74qqEgi0Y1WBjRMgizfG4DrYf2hRih/ERqFr6USIu7+8g01U
	T0fwZn9xuJ7JIR0kKlBlfXqr/rMiBl0ryZtoMnc0CMwH7ai0lVGhI7g/MmIRoxnklBtCCciMWXa
	ZwJO+6lymvGC7SJhDKfRxX2jWGAuMYP6iuFS7lhGwhKphEKg7+uHtCNZIjpBpRP//6j2oFNDhz5
	7qPPxLRPovQcp6jI9Gayp/SkgfaY6SWL2+3OtEUiY02hvoWBrIdx7O1hWVEuaJeTuYig==
X-Received: by 2002:a05:690e:1181:b0:664:ae6a:eeb with SMTP id 956f58d0204a3-6659664e507mr2523260d50.73.1782942680377;
        Wed, 01 Jul 2026 14:51:20 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66623df955esm275466d50.5.2026.07.01.14.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 14:51:19 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:51:19 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, 
 sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
Message-ID: <willemdebruijn.kernel.3788f4681060@gmail.com>
In-Reply-To: <20260630-getsockopt_phase2-v2-2-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
 <20260630-getsockopt_phase2-v2-2-193335f3d4d1@debian.org>
Subject: Re: [PATCH net-next v2 2/4] udp: convert udp_lib_getsockopt to
 sockopt_t
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Breno Leitao wrote:
> In preparation for converting the proto-layer getsockopt callbacks to the
> sockopt_t interface, switch udp_lib_getsockopt() to take a sockopt_t.
> 
> The thin udp_getsockopt()/udpv6_getsockopt() wrappers keep their __user
> signature for now: they build a user-backed sockopt_t with
> sockopt_init_user(), call the helper, and write the returned length back
> to optlen. The helper uses copy_to_iter() instead of copy_to_user().
> No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Willem de Bruijn <willemb@google.com>
