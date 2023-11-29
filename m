Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="by6h9GTu"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72F210DF
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Nov 2023 14:24:55 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cf98ffc257so3048195ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Nov 2023 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1701296695; x=1701901495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boH2XvYQnpBpBXH5Z+yQzRXQ5rbOkFbvurC2g24QJlY=;
        b=by6h9GTuIXHQdcm+9KtaMeVBv/jQBcwbEEH2zt0r1lF5RxjOZEQPMJIt09kUSawI+t
         Gbzy5PcOuzxIwDSlAQv8gxk9P/kjp5yZIKo2d2RPmBiiqdYsIa2R2BoL/AwRNTQWWvZS
         iQUmUAfczGjhNJQnNdUAHBsUZqcbL4J34VLTYbqnZkSDIkb2dF1BpvbIF80n9Kb/vrSD
         HAlj7DrQXudNSjP2I6qAm819VK6VwaNiKfmsJXU4aELgTu1kfpQTIHJJghROmCw6/NdV
         L/j0VeWoXpLlOcKqaJIHtT7CvNTJUZWUHtTZcAspKxS1EJtoOjhf+GzUWpc8myogTJf0
         zfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701296695; x=1701901495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boH2XvYQnpBpBXH5Z+yQzRXQ5rbOkFbvurC2g24QJlY=;
        b=M0/mzToLTbJ/Q9GbhE/nJsJqkZw1kunicfJwbJuw+MeFwwYUnrnfxwOYpBlu22Hs8k
         WXyXd6TyzgWPJvsgYWi7lF5RiXQcELa14TacKM1HqQSTqrwAjnq4E03XKlWaHcK0jTBz
         XZXym7GV7MgtYRzRB54wHBlH7VlGCU9PTSF44mB4kwaDz2JhbJrTMdLn5Vz9LKvuhBYd
         Y3cD5hH1lfu9gKM4iQhLGR1kR2AD0YYleWjWxzRaW/JKjy4+3VcA9R5+VUSgZNcRpQw7
         xz4uhopiYUmTc93klj1uzrHqIT74x/E20Bd/VkArHKxT9THFGOdXXK8tspxD+rpB6faC
         BpWw==
X-Gm-Message-State: AOJu0YwexMSNv14Nt0O+RM9MuYS0zNc2BA7LBASaWXdJ6EQsmTq9kGPV
	Y1pBN124ScR/2H5Jd4QG8MeXyg==
X-Google-Smtp-Source: AGHT+IFvmJExB91/kXCn45gNOep8CJWPXl3id5s9b9Htkc5jp3hI1N5aGUPK/r8ayf6P5+GL9QpEAA==
X-Received: by 2002:a17:902:da8b:b0:1cf:f506:c98e with SMTP id j11-20020a170902da8b00b001cff506c98emr8020601plx.16.1701296695300;
        Wed, 29 Nov 2023 14:24:55 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001cfb971edf2sm8663697plg.13.2023.11.29.14.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:24:55 -0800 (PST)
From: Pedro Tammela <pctammela@mojatatu.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	linux-kselftest@vger.kernel.org,
	Pedro Tammela <pctammela@mojatatu.com>
Subject: [PATCH net-next 3/4] selftests: tc-testing: rename concurrency.json to flower.json
Date: Wed, 29 Nov 2023 19:24:23 -0300
Message-Id: <20231129222424.910148-4-pctammela@mojatatu.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129222424.910148-1-pctammela@mojatatu.com>
References: <20231129222424.910148-1-pctammela@mojatatu.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All tests in this file pertain to flower, so name it appropriately

Signed-off-by: Pedro Tammela <pctammela@mojatatu.com>
---
 .../tc-testing/tc-tests/filters/{concurrency.json => flower.json} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/tc-testing/tc-tests/filters/{concurrency.json => flower.json} (100%)

diff --git a/tools/testing/selftests/tc-testing/tc-tests/filters/concurrency.json b/tools/testing/selftests/tc-testing/tc-tests/filters/flower.json
similarity index 100%
rename from tools/testing/selftests/tc-testing/tc-tests/filters/concurrency.json
rename to tools/testing/selftests/tc-testing/tc-tests/filters/flower.json
-- 
2.40.1

