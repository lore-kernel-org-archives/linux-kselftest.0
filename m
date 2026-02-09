Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF273815E7
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770670619; cv=none; b=WOPvwcdMjqbzxEIbDJDb3LkCtKRNrAh78j3P83wk/ZclWaSC4q3VVoBmVsrEpI03RvchbEsfLWVIZf+qu9HQKfRWUepBEU8mJYL6/AGcVB1mUXmhaNw1eYl34B9rvxExGr27YLB1qx9Ee+k1HCOiLozY8V0xj402xB6nDCPlvag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770670619; c=relaxed/simple;
	bh=Fl9o+jgbnaLJ4/LYSzpCmFtZ2ZK5bIMEd9yGhaWj+Sc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iVuYxXUZgl68XgKtXrhaXuhxkTDhYLOvsWoiA3WoguNXc77Q8F5VYPA0zrxHshnAvOMkCssyzWgLNhHTm/MmTfHceja7yuiYFDHl7NrOB0R5xvRNsNWSv7OFo6Jl58QWv2mhJ7nMQVpUK95hOUvEp1HDZG5EW8BonsLNvJc69mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sVXGzF2A; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sVXGzF2A"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2b86addb8b1so97193eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 12:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770670618; x=1771275418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl9o+jgbnaLJ4/LYSzpCmFtZ2ZK5bIMEd9yGhaWj+Sc=;
        b=sVXGzF2AzvdZCUv5GU9JsUrUaStnXObwAhUqvOR/hy+QkD7c0XOlPk7mgWK0AJtJW3
         XfkTObba9eDO8oPo4H9AK9xBiorOnw+piKAjUiF24kJvBrn7kmJCwV+zAosN6e+zZbt/
         4bsWQotgHEOOlj37SkpEFe0fzKndIx6YoRuNHWHMTOrrV6d/KvAOXk9TiC1te5M/g2Gd
         SQvvHIWRBJKH6ZmZuGM0c3l0Pk2vNXewrcGLgZl9wC50HvPEK/K0rNMMwOAajWQVYHor
         OK1DRnMN3n6hyJWQX2thSqyCV1Ugq3a2K/t/jLHwbOcRPadNMY7ySOPDkMFz4BR4Bqoe
         GtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770670618; x=1771275418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl9o+jgbnaLJ4/LYSzpCmFtZ2ZK5bIMEd9yGhaWj+Sc=;
        b=H7Q4mk/4A+5Iw/TA7lSgG+RV/mglPxtGhO4S211dOPwpPrLk6dnxyZP/uHI7UH9sXB
         rlEQDKzh95g/na1JV6FqSYoJVIgPgqsBmVAPfLL6WChnmcHjvX3zhk7aDq+KT4JKuanW
         VDaFZfNtdr5hFJ72e+vkdE0DbYKlHCZb1ZY74gtvDzzIZk/y5yuYaYLQoZwH7gqEfols
         bKAhnYCiX7sxhAvZr5qhv3oHz53aviEgFdYuHtOeORveZZJ58tzIsoah5liPwt+AgdmB
         EsRtYFbOzRDEm6AZO1LbnrGJ68Y+iGvOWS260zJRHyaDOgcvUhoWSk3CsXo7igaAZWWQ
         sFMg==
X-Forwarded-Encrypted: i=1; AJvYcCXMMb/B33m1jshrL/SK1QCic0Vd51iqWc6Wy8Naxwh6+WPQWgvgesnMoKLbDdDrFXB5FSV2QwhauvhwZF4PDco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfrqt3CGDPX6YCdPrs4MbNQ9YJF5IwANkiqIVVdKOkdH7KGck
	9/6TdSl/tqGM+sifnMrhpaCtD+c/9zp6WmMzHs2GvuFrqzslrHu+7UtN7pqfU/ldHwqR2TuwzHY
	zbC3N7gMwkU9GMSFy2C74qPKZjo/o0ZYhQczRnA==
X-Received: from dygg5.prod.google.com ([2002:a05:693c:80c5:b0:2ba:817b:8bec])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:2383:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2b85642c7demr4739454eec.8.1770670617874;
 Mon, 09 Feb 2026 12:56:57 -0800 (PST)
Date: Mon,  9 Feb 2026 20:56:55 +0000
In-Reply-To: <98e953ed-616c-4684-a8e1-87195349ef4c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <98e953ed-616c-4684-a8e1-87195349ef4c@t-8ch.de>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260209205655.119562-1-jordanrichards@google.com>
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
From: Jordan Richards <jordanrichards@google.com>
To: linux@weissschuh.net
Cc: dmatlack@google.com, jasonmiu@google.com, jordanrichards@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	rppt@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

>> +#ifdef NOLIBC
>> +#include <sys.h>
>> +#endif
>
> This should not be necessary.
> I am actively trying to get rid of the checks for the NOLIBC macro.

Oops, that's no longer used directly. Will remove in v3.
