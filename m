Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F29E114
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769627194; cv=pass; b=W2ZdXXt531mPJvjdxQVG7Gx+DEGejhjG4ulKTRR1ZXx3pafgEpmhjUXExtZPNPskF60hMrtzLgeRrox2YT/Dt8lcRw4ZvAWDB77Rd/P3W3o3Hl4Fy0sQMdsAJm1ogTjbjs1BUTac98EBTc4sdt6y/N9mA/yIgYwo2xwgz3XExcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769627194; c=relaxed/simple;
	bh=9ERFjcMxrp1Lrat0Wg1Z6M81o4oaqai31qW//33Vyio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPX/jdCDGVPIbIkL74rmW1BFM1GaQzubB2ZjpgIeW7k/gURfdiufpFbO9If1GNy6yhJXjo9h0pAJYtcTZREjOSStSIiJWnjH72eMXCLb2eN+WydWQpnRWV2oNRlY98wQ+yoL4EyBCnsO+CqrOApxI4HiKJsg88Mimz0SwWOLdNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NgCILPcN; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NgCILPcN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6c89d302so124357e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 11:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769627191; cv=none;
        d=google.com; s=arc-20240605;
        b=Hik7RTUIIMk3vLbloJSsj4qxM6S14krGlbQMitRqzrW6DY4ITZBh12p1TwqparPNqC
         KbaUcg1w6d2OrnSqRkds2WtJ5chtxGYERiWyJXfdXpQSu73hWOdY/Fj8FF05924mO7ko
         XE6SMiJIlalR+hsvH6BIjIgB5AvUVuBJmZOwmv6hycS/5tkB0Qo1aIaquqNS1GF/L63q
         TdQgsAlAzZQzie6sM8uZpqMqXQ4HSGesjYD7nW0x1juD/3lzUjvYguKDj9WIDIOYOa2Z
         vtXBM87pP3CQd3jn1msFFCyCLBrBEiNNmolIShKPMasFuP/b8TeMKWybh6kd21GjAuvp
         AVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ERFjcMxrp1Lrat0Wg1Z6M81o4oaqai31qW//33Vyio=;
        fh=SzjS3m4jSQMmxqyjFFh+qGv0hpgC1VkPzHa7TOKnKus=;
        b=E4okCmTjLR41PvzNsXtVr0K5FieSLcCVBB9JivvtIMVCswO8j9ybH7FQRI6bjbXRqH
         1m2iczqBIbU/Psm39ijcVshTH8mu+1M688HA+5NOT8oNgChiQuERnoIb4n611K2gi873
         ePyvdKjTsLq4ejf3Gz3Obk1JCCg/N5M/OhpreQFr0k/02mn1vvtsFjWLT8xIHBJHjcQJ
         DezMWGDFHOXZHUSV0J22LBlAEmvZjgqtJXWZnSFBOw5AB/KS9sEP4Ud7l0AbTj+uK8IT
         yWwIx8AlLvaOc0a3DLq5aUQ6hKNPnVSiZ44Ihn9zI+w7knkmQxgA51z+VUpEWWf3AlJU
         3rFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769627191; x=1770231991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ERFjcMxrp1Lrat0Wg1Z6M81o4oaqai31qW//33Vyio=;
        b=NgCILPcNSwS2HyBL1jvIf+akIMpYcyDfheerY2E/wsh0RrcfuqysqK/t1dD6VlnCjG
         YhUmcZLzjbyc4mY3JiNcQhVe9Zh0Bw9N+vFO1T6T6/1P7CsRDa+Qq7X+rbf7XwnYVFbu
         VJjRuVjW4yBMb4tQTEM53oK1IhXIp6I9BHvFp66JvZ9G2fMKzR2ob2A2L49YyO6mkGZi
         C5PGgT7U08ofPeVP7csO07kb2DlsRauJG2ThSsQtKTk4hW1M5x9g5MLwtAe3QgOjT3mc
         zqXXDNTcNV9KvN8i+pXlFdsFPuKlOIHBZJW5uXWyYiyT5cilcxsrfjFllqPs5PeRF2Tn
         BENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769627191; x=1770231991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ERFjcMxrp1Lrat0Wg1Z6M81o4oaqai31qW//33Vyio=;
        b=mo6pB1Lnsz5075VXdUp1BOZo+WnlXGmlLYeeQrpWBxxzD1iaYkQS9FpotbUC/6mNf6
         hCxlMzD3+2vbsJbJrc0mn4KrW23m2/2gCEvdff1YGN/wL9lHAiUVmyvJpmsg8r14s/Eg
         VXaPLlFErm0J5/R1T+v2vImcPddmZJdRLkYrk6vAZiPTyKO0u1Q3jISW+xO2doT6UvCx
         uOz1kyIdOcRYbvAWmtOCQr8I+bCrfNVTTOHNQ+ChOOF43NhQQV554ASG7YHrA7ORpLR4
         bkds5P38NX7LRNL5i4OKFsWAXu6yngaxYOz8rZpfk4+l9kp5ss8xvM7iDz6Oo/hWGYm4
         0S3A==
X-Forwarded-Encrypted: i=1; AJvYcCUgxSbgWhRQa/EzNt9mGN/jhlVMoFMGKYk084nC3e1uqa4zasHrhNH9lqjWGNeWRwCFABTOYj7G93QVEmX76W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5GW3lDzvcFEbkwIdcigH6QtJQjd72YBqAUb9jKVRdRb/uh2w
	CWRIrh5Wacfk5qGQY0vvs+TzswuiCUmESKvoGSdeAFX3xQi3IsT8TO6d5w4dlCVh8hJ24xsqfFE
	btUcNKS8D16MHiUrF1oZez1Lp+NQPnaFtWvUflcCD
X-Gm-Gg: AZuq6aLTOQMB6nRcHPjt7xxtWb7M6yl7DVZH5Q/1EvpU/GmZQq46LbnajYmnTFP8lvS
	RJcYmJT+mx4mnRxiy1D4CIbUW+PBeOUAQs1lYOPiqu55itsD6BAXO6stDkK3mT8QGtK0jJyJL32
	dzUcnWA/ncbkJLkqEgsFUzQk2iqNtbdRgLu6xhmISXviI0Gud8YNFc51fKuzwRRg6XZlnA0cMon
	9Jgl7XvK3VCth44ZU7SKWjxun4ql/vlCbPzuRzFIaBrAGdfqgEDZ4zujCyGbbLWrYyRRg==
X-Received: by 2002:a05:6512:800e:10b0:59e:476:a1e7 with SMTP id
 2adb3069b0e04-59e0476a285mr1721613e87.14.1769627190621; Wed, 28 Jan 2026
 11:06:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128183750.1240176-1-tedlogan@fb.com>
In-Reply-To: <20260128183750.1240176-1-tedlogan@fb.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 28 Jan 2026 11:06:03 -0800
X-Gm-Features: AZwV_QiCfY-gKazxXujHuB-Px-mOodRPyZ3KnKJr-7oxiY8ldmqZpZW_6Z2R1Uo
Message-ID: <CALzav=dMhycS2iBxkhPCz3tMUKxkfgr1dCLFGYzGuXZCeYhijw@mail.gmail.com>
Subject: Re: [PATCH] vfio: selftests: fix format conversion compiler warning
To: Ted Logan <tedlogan@fb.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Alex Mastro <amastro@fb.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 10:38=E2=80=AFAM Ted Logan <tedlogan@fb.com> wrote:
>
> Use the standard format conversion macro PRIx64 to generate the
> appropriate format conversion for 64-bit integers. Fixes a compiler
> warning with -Wformat on i386.
>
> Signed-off-by: Ted Logan <tedlogan@fb.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lkp@i=
ntel.com/

Thanks for the patch.

I've been seeing these i386 reports as well. I find the PRIx64, etc.
format specifiers make format strings very hard to read. And I think
there were some other issues when building VFIO selftests with i386
the last time I tried.

I was thinking instead we should just not support i386 builds of VFIO
selftests. But I hadn't gotten around to figuring out the right
Makefile magic to make that happen.
