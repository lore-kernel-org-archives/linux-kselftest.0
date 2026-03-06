Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4B2D877D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807426; cv=none; b=oDbYX+BA9UBnoobgtTYBKPYwOCiKdyakGeFdvYO3pR4kf7TXj2YDc7+7LqJczgGKmYJZZ/pPt1g6el/RMVsUKWB+F3+MvZjvcVNuM/J8Fh0ze57umNBB8hT4mLxT7h/Up/+prVKoL0eDPij/wHw+MRZgQXGfeRQ6MIbswhlEBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807426; c=relaxed/simple;
	bh=xHwzPHg2PbancKhv5xB7MyGG0IE0UTSxx1kPLT5Uc5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOYBMFnjOuZr2tF8EGWz6q0Os1UMbzMioL/Ky0hzZlcQOD/u1KUv0WBeoFKrzFek296tI7CQqmbh9VNQNYuw0HFE85IL8Ge9y7K8mEGdLnLKZVx148aMS1H3DwJN9eUM1QkP4Xl/E0JV6HZFjrcSAv9Ap7+G97CJr62NRH6AEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aXi9E0SK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aXi9E0SK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so61531945e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772807423; x=1773412223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a86oWd1bJB3OKdBhHnrQ36OfJNveNdTbDopRkwqfS6Y=;
        b=aXi9E0SKbcu9T+ESl8MYjgAno5lS5nDJjFR7ir598zoClxEX7D2qo55VSbXuwS0QJh
         WqBqDyKDDE92koH7TNdKo4ZXkSumKg9y9yUIz9lvHSaR8yvgyHcmVqXUskTLDh0NovKL
         eD3zXuWJUTQbhZlmKK6YA/8TCrH692de/Gs/500BgOyjaYmTYIeWFeiQSUOAshyH2LBk
         hYpHj8NluloXcsaDr8q+XSI17hof2ndavxt9GHi5/VmRfxnk4xD5u8WfzaMpx/+1jcS7
         8xhkczednhPt983wRS1oQQL8Ndi75c1QayUEIEN0kZKz+4uRCiE9NkfDSn7ZvJjQcu20
         yF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807423; x=1773412223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a86oWd1bJB3OKdBhHnrQ36OfJNveNdTbDopRkwqfS6Y=;
        b=LToa2XKLRqmlUOEGZG8HIJuIY9LjvXOlWrQStWxHL1+trROIh0mfwNdiEEhEO5qC1v
         DQEzq7UN0I9XOuoVpFDq2V733abuzEjr+JarNDzoknka29EmTsSGg6REnAYGetlrd4MH
         aZRsniM3VQj9M4Sb5wmk98c79Z/jVOWoovUfhwHFBrX/5YrkZtMw1o+J3fHIJJ1TXWnw
         L4Pe7bRmPDJ0e8lU3Z/rs0xWkpEclQlnSlQc7iXT4ei7hyaGTnJSqFyQ4bjwAH2Uf5/Z
         XQbtRdNZEwSH9Gd+7+xgww3aLPGawDb8n+ShN6G8Hcq+qJKPiSg2IDHXPFm/LQ2wAMGZ
         RvLg==
X-Forwarded-Encrypted: i=1; AJvYcCUceQf0HRwlCeMatqlc+68lBvJT62aSVUWY3DXAorr/h0wWWotqqJsyChLjMCF7sEaBf/MzzgnXm7IeviOki4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10XvCR6j5DbIzc5zJ42OUvBAP6wVTI22Oav9HJ7THbF8AOcVd
	8xSw6crWnw2M1Y29PQLEdvoF8+4HSvnQi0Mq6zGOFlyI6kkDWh+96v4d1Am8JvGDyik=
X-Gm-Gg: ATEYQzzbIM17QUUC0ci9Iuy2KhT0XGLnwlPFheXrPAiKTCfiF17T/fuLe2tEjNJQtAC
	zLgT6aOwKNleibgJkeVcwMIRFBvf8kL/tdhLORVSKXXqv28jxGcVZ2AphsUL882vuDESqM2c7vX
	2uLhUbUb76azBbwcPZcpbipVVPGU71tWNHGa2faMh34IJdkaMQwCScECmKFSLzJ6jcOGFTwUnKU
	7Gu38Ldie5WGKBnizlEg3u6dRmkuQVckJH4H7rgiIts3C9pekvsKrwCO9+FyuRcv56L8p2Zh0jJ
	rzmuJm4Ir0IVeuRQDFMAyws75c4NZJUSep5AwSQ3nWztfvpsSVibETj+gjM37SP6KuKpEzuwZks
	LfBdSD/FNulX93LCscWnIsjHF1tBFa24J5kXbmNqfsVoxOET5mMvQ+CiLYX8gugsBWWRFddpqkM
	GvQ/Z6drj7oNlOcnCuiHDWhR3r7g==
X-Received: by 2002:a05:600c:6992:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-4852692785emr36510585e9.10.1772807423422;
        Fri, 06 Mar 2026 06:30:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm4641780f8f.36.2026.03.06.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:30:22 -0800 (PST)
Date: Fri, 6 Mar 2026 15:30:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
Message-ID: <aark_LapcGkPjrLu@pathway.suse.cz>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
 <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>

On Fri 2026-02-20 11:12:34, Marcos Paulo de Souza wrote:
> When running current selftests on older distributions like SLE12-SP5 that
> contains an older bash trips over heredoc. Convert it to plain echo
> calls, which ends up with the same result.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

JFYI, the patch has been committed into livepatch.git,
branch for-7.1/ftrace-test.

I have fixed the typo reported by Joe, see
https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/commit/?h=for-7.1/ftrace-test&id=920e5001f4beb38685d5b8cac061cb1d2760eeab

Best Regards,
Petr
