Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFC2F2619
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770068943; cv=none; b=MUwMQy9yqw8BBFbxohR2QWURcQz//EvdHAT9ed7DDJQa0Hlgm4XkHC8BZN4LTacwHTR6fP1UK9/fY9OwooJDr9AnwxrBK/qQaD5h7RJKWDdFZ8FP0JQsiBPBy9pOtB/+rUMdfCkT85OjgYEflxV0eKO6D8icDYKkZvBY2rOT+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770068943; c=relaxed/simple;
	bh=XySWeTq1x/14+SNZY6U2jbomS9uWDyEUitLbWsXbRw0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kniPyZkcCQJch73sbZM+SrKdrvsL107gYbtT5K78qUZVrm42bC5PgiwMSxujkBGgHuXNJ+/8uYPyPMhGKhH4zcXP6zhrMfhluycmrzo7zEq2JElLDlJCv8YNsOTV7G9Wi5QLOOk2i0hPV+IlVSzBRyiF+qwx7PoZBCgi8jtEhXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ygyQkD3m; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ygyQkD3m"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b7ef896edcso9011663eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 13:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770068942; x=1770673742; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGd6G1Vb/3CvX2kkVP9M1fJHJsx1i2LSzEHZHyKjpyk=;
        b=ygyQkD3m1FhmVP4KuD1Q/ywR1q8qqyL7Xaz1j2GvkvbW9Grej7Sd018dTsCRqvZLW6
         a/SPA3z4V3TqxOZ+1zvmxusPqoohlnDApRR1NBfvoJooO+qN2vVAi+mwHFIX/RoifxfT
         Y2pyl49dNh7MM0IFQ+Fk4f+XQqzFhLh46v8bNtgDrwK4dmT8LmBlkeMe4jv7G8Cp6z7A
         0h5a3/9YF20SHhj3yjIzCXVtKZU23oIUN/ONz/YnFOE5za4MnvDEDSCUyfWEem9qH41e
         hDBalhLSovL6GP3hOX6QSf2el4N8el4orgmBcGp+pECqKNuzX/F254ZsMaACx/MmBoQj
         btOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770068942; x=1770673742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGd6G1Vb/3CvX2kkVP9M1fJHJsx1i2LSzEHZHyKjpyk=;
        b=AP5BkXFRj8YUJLWyJ/fvvwz+OQVFLmd7Zpi6bKi/gQq6qKAHv748g/Gze1xCsl1hiW
         Ov3dHBk1UKMx7Z6POd2USVrIlGMcGGAqfIxLe7KIukSy5h6OBMOLsIrwDvWmLxAUctQG
         8WV6EylWZ0MPl/kj9S3WeLW0+N6XnduHk+6xf/Jr0037s8oxtKQc66+waT8R0Wwnwlk0
         yxOxgLjaXDPTkNC2te+yXgMI9gfDQjqfETXCEGDa1H43mF5o3mL/ySDDikkcdeQcZTj7
         WivO8B4iIp4EBSIXTApjDuEUutTJWlf0JmqS8cM9GIJI+qEOFLe11Gs/rnMNRofEmigE
         tyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd3D4ru0QJbnisfVFrMliA+G5UNt9IjdqrOgRviWN+tNjaxWwHcIM/Lqmlwd63oXo3Wg5Wy1xzOANBFzgWEsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKrWBYqxEJx+Apu0BfKsNT1JPeJS+hLEz3Xmz6iru35XPxq7W
	wuVXowFSsiORHiLu+sLa89lAp9579D/obhKR4soAZPbKQT2nwStD5EUdBP0+zKjKJKiS3WuYlXI
	yxDSdwR90ZMvHaxw+ksyEjc+rj9Jf5REESj30Tg==
X-Received: from dybnk15.prod.google.com ([2002:a05:7300:cf0f:b0:2b7:b47b:2f2f])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3d15:b0:2b7:2dac:5853 with SMTP id 5a478bee46e88-2b7c8626756mr5756175eec.2.1770068941732;
 Mon, 02 Feb 2026 13:49:01 -0800 (PST)
Date: Mon,  2 Feb 2026 21:48:59 +0000
In-Reply-To: <aXj28ZAsPhp7s5sm@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aXj28ZAsPhp7s5sm@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202214859.662889-1-jordanrichards@google.com>
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
From: Jordan Richards <jordanrichards@google.com>
To: rppt@kernel.org
Cc: dmatlack@google.com, jasonmiu@google.com, jordanrichards@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

Thanks for the feedback.

>> +int sys_ftruncate(int fd, off_t length)
>> +{
>> +     return my_syscall2(__NR_ftruncate, fd, length);
>> +}
>> +
>> +int ftruncate(int fd, off_t length)
>> +{
>> +     return __sysret(sys_ftruncate(fd, length));
>> +}
>
> These should be added to nolibc I suppose.

I notice that nolibc has its own tree. If I patch nolibc/sys.h,
will those changes make their way there? Or should I avoid modifying
nolibc/sys.h and keep this local copy for now, to be removed if/when
ftruncate is added to nolibc?
