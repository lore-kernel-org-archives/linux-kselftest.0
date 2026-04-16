Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B9379996
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326839; cv=none; b=em3i6x0orQ9KiU1CQdsKGyqV22mJDZBi87Q9/hsqCsJiGYBjVZ2fD5vzJksgjEndmRpyqj62c4jyTZJhJOEPQZ06WZl8gkiVxl/Box6sJvmU10cVss+b5xRAj8g58H6+QmUha52m73HEMF96XN20E5yHuhMV4xruTXKkVoS1XA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326839; c=relaxed/simple;
	bh=LtTfUHEnwBxkkN85Hf8PkQOmmfE97daUPWCqJMAQZZs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uWJimRctes24+z44JxJqXkvV8daDTRgIjZlEchfhSIfaGv7sMLw8p8RgRCArGUniz/R4BowKZVJy7FjeOS/u3wXXdHDnRQmYEIByofZR7bFqW4lIi2yNzxxDiKi7aGkhAub2wyWzfSYGy1CPhWoSvuxwoIFM1QQs/6QQj+3DIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qNcFzZpD; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qNcFzZpD"
Message-ID: <861b722f-6d5e-4f47-9d17-00a98fceb8cc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776326836; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=FYIeF8ld//Ci23/JH9WUGw6ZRNbtm41sbeGdFAHhNMk=;
	b=qNcFzZpDyaCTQBM1PnlrvMSq5DCSOLienyHv6+JAA5fJNb57K7PuwEbgSQ9CMdMYSZnmnX
	HGTa1gRve+2kl7Iuv/SO6rsDzCK+8msXRcWISLSWi89u+W9i2Q+1qfXqdw3GDUaEd2A5/B
	vDMfWjUGP1vpw2cyPSh9dwSQVmlpvOc=
Date: Thu, 16 Apr 2026 16:07:08 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
Reply-To: 20260225010833.11301-1-liuhangbin@gmail.com
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Brendan Jackman <jackmanb@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi, Hangbin

This patch broke selftests run with `make -C tools/testing/selftests` as 
make uses /bin/sh by default:

/bin/sh: 5: 
/home/qf/linux-next/tools/testing/selftests/kselftest/runner.sh: Bad 
substitution

Add `SHELL := /bin/bash` to the start of lib.mk to fix this.
