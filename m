Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326D3BE65F;
	Thu, 30 Apr 2026 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592489; cv=none; b=NQsLMXBCRWyr8dmuqBSWbBh/xDGgEHPS3chAAnduIAWGqwMqKfeyWMP09DD/tBTfGBXNBoSAe0fNiF26VzxiKxxfTXg6d0dQRiH2QcMZbIaVdW3t/etnlFay9mbJPqqFGlWAQjd1O+E6Doc4bd30zSYFs3tZ6Onl1eahpOG4Myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592489; c=relaxed/simple;
	bh=b+adlYrLUJ7yh17dv8Qm4USclJ2dGTLVU2JazuPhuOE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O5Jsq7HJjYwl/2U/m/bAwyPg5JjDZu1Te03RR1HhdCbrIBuqJkwc8qXd3qXX7o/cpJrH3+BGONiG38P+Fk1pv/PZBIOn17/CZug19AjcELuPcUkIWjouOxOF3qUFAG46t7EYKdR4LqlhNffHhC/0ggmuVneFd3tB7dKGLK/7Gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Dw+l7Rlk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Dw+l7Rlk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAB1C2BCB3;
	Thu, 30 Apr 2026 23:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777592488;
	bh=b+adlYrLUJ7yh17dv8Qm4USclJ2dGTLVU2JazuPhuOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dw+l7RlksGbMWY+gDvCX1nfVwxP48Hh+nOUb0j/ICRpOa4qw3pqFziFb26tM+VJ9q
	 r9FeqpEQZXYwvmIJNpIw8OAJ5hqz5O3hKDlNUEDc4XdAc8+FJEZSURXUdp9fpmUakO
	 HSAV9JOyqVaz1pfDe8SUgIdIdDlZEIT9lWxR37Sc=
Date: Thu, 30 Apr 2026 16:41:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: andrealmeid@igalia.com, bigeasy@linutronix.de, colin.i.king@gmail.com,
 dave@stgolabs.net, dvhart@infradead.org, edliaw@google.com,
 justinstitt@google.com, kernel-team@android.com, licayy@foxmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 luto@mit.edu, mingo@redhat.com, morbo@google.com, nathan@kernel.org,
 ndesaulniers@google.com, peterz@infradead.org, shuah@kernel.org,
 tglx@kernel.org, usama.anjum@collabora.com, wakel@google.com
Subject: Re: [RESEND PATCH v3] selftests/futex: fix the failed futex_requeue
 test issue
Message-Id: <20260430164127.b8d68639a5c1708411cf7508@linux-foundation.org>
In-Reply-To: <tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com>
References: <tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com>
	<tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 18:18:38 +0800 Yuwen Chen <ywen.chen@foxmail.com> wrote:

> This test item has extremely high requirements for timing and can only
> pass the test under specific conditions. The following situations will
> lead to test failure:
> 
>     MainThread                  Thread1
>         │
>   pthread_create-------------------┐
>         │                          │
>  futex_cmp_requeue                 │
>         │                     futex_wait
>         │                          │
> 
> If the child thread is not waiting in the futex_wait function when the
> main thread reaches the futex_cmp_requeue function, the test will fail.

So you're saying that this test is generally flakey and annoying?

Yup, we would like to fix that.

> This patch avoids this problem by checking whether the child thread is
> in a sleeping state in the main thread.

Thanks! 

AI review asked some questions, as it likes to do:
	https://sashiko.dev/#/patchset/tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com
