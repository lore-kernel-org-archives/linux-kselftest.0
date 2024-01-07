Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C610A28
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jan 2024 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TXKH4H/3"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ccbbb5eb77so11686711fa.2
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jan 2024 10:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704652928; x=1705257728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s0prdEAj89MfCO6uINX9NF3GFv49wanD+YL5iJFREZs=;
        b=TXKH4H/3zVH7YDxy0P8kD/8ppzsG047Zb4Aq5FJ4Vkjx5CDlRrEI1BUYIjhskASnZY
         5SDp/2IoTOgLuATjsuhw5Q7gIl/T8DFeFyryx4cBAWEldkHlrV34OzbnqkHW/YSAWJO6
         ZVZ2dbXwRyW1af2lDQJAmEStzM4PnwhE0ljTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704652928; x=1705257728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0prdEAj89MfCO6uINX9NF3GFv49wanD+YL5iJFREZs=;
        b=ijuZfKA0w8cgJJH/oIhL9E5RzsITOcFNIrKWoTZxbCjVxe/nap3E7uuYVIKhXm41iG
         oiHbtu6sLWJHLnzbklUAZSWa4vKrvd3lFxj9DjjEDu/S+8pLQ5pp7F7amYiazfe9zObb
         5wsVJheI7+8WCf9qi/KGwq/KfrZUbFtN9CUqexi9I4lUiuyP6Gg1Cw+RVSHWsXEYIFqx
         iMziNrSNvCop25SkiTC8SwAy2URSJVGNG97sc6+1kXd6IXMY2HNDhIb8IM/xaPz1pV/O
         M8kLs9pwYu68cFJAE0ZfxMUg5yRoVTtm/m86NYSymI+4ZjILcPHrAtApMrYR5/5pq8Jt
         DplQ==
X-Gm-Message-State: AOJu0YymOmE6LCXVSEJl5qb2G7ASaBibabpBwpiyR/sZcUGBKg6RJkjG
	GomxuQPdC0IwWI1pa5ezKnHlNnnrwFfl2l8Ory/JBWTw0dr2N/CU
X-Google-Smtp-Source: AGHT+IENGrlCCG8Bwoi9F5uBU1oHoJmrKWbdbZ0F+jPl2EKyeW2F4HxriUGdlXoLvC/gSbWZ6ezwXw==
X-Received: by 2002:a05:651c:1072:b0:2cd:2463:8972 with SMTP id y18-20020a05651c107200b002cd24638972mr871164ljm.48.1704652928283;
        Sun, 07 Jan 2024 10:42:08 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id x8-20020a05651c024800b002ccc4de3f95sm1242208ljn.60.2024.01.07.10.42.07
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 10:42:08 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e8ca6c76dso1102479e87.3
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jan 2024 10:42:07 -0800 (PST)
X-Received: by 2002:ac2:548b:0:b0:50e:7dca:7f93 with SMTP id
 t11-20020ac2548b000000b0050e7dca7f93mr823836lfk.77.1704652927542; Sun, 07 Jan
 2024 10:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104185138.169307-1-jeffxu@chromium.org> <20240104185138.169307-3-jeffxu@chromium.org>
In-Reply-To: <20240104185138.169307-3-jeffxu@chromium.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Jan 2024 10:41:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiy0nHG9+3rXzQa=W8gM8F6-MhsHrs_ZqWaHtjmPK4=FA@mail.gmail.com>
Message-ID: <CAHk-=wiy0nHG9+3rXzQa=W8gM8F6-MhsHrs_ZqWaHtjmPK4=FA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/4] mseal: add mseal syscall
To: jeffxu@chromium.org
Cc: akpm@linux-foundation.org, keescook@chromium.org, jannh@google.com, 
	sroettger@google.com, willy@infradead.org, gregkh@linuxfoundation.org, 
	usama.anjum@collabora.com, jeffxu@google.com, jorgelo@chromium.org, 
	groeck@chromium.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, pedro.falcato@gmail.com, 
	dave.hansen@intel.com, linux-hardening@vger.kernel.org, deraadt@openbsd.org
Content-Type: text/plain; charset="UTF-8"

One comment:

On Thu, 4 Jan 2024 at 10:51, <jeffxu@chromium.org> wrote:
>
> diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
> index 9a846439b36a..02280199069b 100644
> --- a/kernel/sys_ni.c
> +++ b/kernel/sys_ni.c
> @@ -193,6 +193,7 @@ COND_SYSCALL(migrate_pages);
>  COND_SYSCALL(move_pages);
>  COND_SYSCALL(set_mempolicy_home_node);
>  COND_SYSCALL(cachestat);
> +COND_SYSCALL(mseal);
>
>  COND_SYSCALL(perf_event_open);
>  COND_SYSCALL(accept4);

Move this part to PATCH 1/1, so that it all builds cleanly.

Other than that, this seems all reasonable to me now.

                  Linus
