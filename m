Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC205382361
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798919; cv=pass; b=PuGqWNE1ZWXW2AZny6FWiiAYnwA0cW2JqI2Y5b+ZdkVSoExVgHmepHUEY0Eqo15dSq5P146SkMqFVycT9Y1U4y5PHEA9P++K6kSvDC06ttY+fsZm8CjSEqEQP3c0pjomuHG6DV0Ws7vDeB2/5fD6mK6pOKbWByK1MJSdumvOEZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798919; c=relaxed/simple;
	bh=wYglXmwgP+JSmWsymKCvK4vue0PoG+iaiidSWX3dgOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHXkRqbk9rplFp5eugsT8roHMogVCztE+0Z20rB5KLdz0+E2kC81KAMGsDGroCU+f6y3HRQCN8qykHCZA2yEZZEFc4tozXF4edV6TsiFnor47sqgctnAyoSUn6wf1BqT57eU5rgRc+FdD5ahzB1zRZA9gMoo4fJEX8/jjboCQ2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anVNJqNa; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anVNJqNa"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7927261a3acso83294897b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772798918; cv=none;
        d=google.com; s=arc-20240605;
        b=SdNdt1vwdEP6ONG7l5TVSN+rqm5s0v1/F/0BS86AIHdmBUQw52dlE2QgTJlIcs/D+I
         CAbj6tD+GdagAjrV0Yo0p9WwoouKhteOK2BkxR33j7ljrqebzm3VxCCl6DCh6lO6nTnZ
         ZJ9cTzGebSkW1o2lpIQ0Hk2nhczDY5wGIcSzVQRAg+fwFesT7rhqGhBRjhbVjcZ/7VPg
         Lpl1OzoZ9NLRmbZIx5DqmOYQG0SoyFfSmDyUsgc4y3ZCLuYQ6Wzb+imKnng7KCrOmu7S
         XKkOT0j7eXcp3wmePvMnNUCXdup7cPsetcS0KitwP6ZOlG/SJLyTKI0hPiviF3AFRVvu
         0tKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wYglXmwgP+JSmWsymKCvK4vue0PoG+iaiidSWX3dgOE=;
        fh=6beXXXlXHsQq+OXaNQSu2Ytb0tJp2btljZIzHfOCDPw=;
        b=EgmBhlrc0281gy0OA+FM0/4XfSAcjYEa1dTJyuSSvdH9/48UKMNPnZEMBe8Lm+4Mxd
         xyrNxTKyOnmZYI8V3bLkAV4c8zsS6IpJQkFk/AA2taPFbNYJPB3boYXTEFINSohh4hXD
         srejE/ZlU1DmhibobSp2B1INTNbTjvbtlFQLvbXs2unsjVKwM5Q/iQu9zf84UImDiLw3
         VdzE7DFam6HY7NS020NhSEfUUTttdddxPmsh6xW6dzZBslSSCdwYkI9ygV6f3WR5BKcS
         9zaKRw1AgyevZzfUa6JGy4T1IvhuRSOclbUsFapFDfQNj5ZEjnUJfwApCbTJ/Ca4yUmX
         1Fpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798918; x=1773403718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYglXmwgP+JSmWsymKCvK4vue0PoG+iaiidSWX3dgOE=;
        b=anVNJqNajBIow9bnVcKquOuiw3ZRjV0TbzHVuQHXbd8WB57LsNa58JwOnKPdYZ5Qai
         1iQAlD8cOWD8jytb3F+s5whibJr/7NCddwIBBP6T/glmRdYNLea1cyVTL0Ow11JvKvXX
         yCotNLWn0LbqWsGMLuBnaOVxk9wYU8ymJqWM0FnsGZO/ELZ+6lLo2lE4gHvyQAVOqW/5
         UIFZHeOzdBY1ZOb0ZPrzzg1TbsJc5eEyMlCFmlEW0r6AiLBdP67fUyu2UJrGdtqVBHtp
         U5DVNIGXCe0ce054z7zs5gj/SJLMiMwY1gHCi+neGjuYIq2S7VOg11c/Nd/mk45jRpx9
         7pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798918; x=1773403718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYglXmwgP+JSmWsymKCvK4vue0PoG+iaiidSWX3dgOE=;
        b=Z6EdTeuneM0L5Q3/HpJBNyfgTzPAjU9vRfucncAtOcTtVolQ0DssgrmJkBDOtY+ty2
         KlcsH8AiNHnZwAnLHQYryT91uSxPHfLLy0pmvlH156x1orE509uuiU1SxTJ2DkLGE6G0
         +JL2CdUn0IOd1S6qxd8tEsmwV4pMX8crvqltxtLYrrw4jn+L8EeAFrWUNVCxlEhkel55
         DktQCoErQLIXK4xoqvd9JL1sorSCcwf7FztMOgftHWdpX9Lhi77Mb5YNxwT9nTWsd/55
         uugLDQlaPVIZPwqpmVlvPkJ4YwttN+ftQl72O1nJcvIYL4JF0LfsEkO3ZLiYJTyYk80Q
         6gqA==
X-Forwarded-Encrypted: i=1; AJvYcCWGpUsQWgaTxA/PqlPHR5kfanumu4eWR2/iG0aUUHTEz1tPMzc0NzV1QsjY3vr6cSEGB5HpUoroGgxeS0BXmHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbPlRFT6gCddbovIimdCABavYgvhvMrDjX+OpzU/WXSzPXsy6
	hAVNCBIZ1Ud/7+ioFo/Ldkz6Dg+2/7rRqwvZetlq8HWa4nUCfeqdN5KPuj4KyAafz8jAdJRLBFq
	6zqkGRPD60Zih/gJg3ZdkgiJ+uysFTbk=
X-Gm-Gg: ATEYQzyBcbagMsFge7fxJnfJqeXK2qhqg4qFYDPceqg5UiAwvgpYJzQfHjtK3exoxAU
	tqtoneFtnNSSdfQpRgze1yCFN8xDmOr0syf0oD50PyFOPq6ozzK2ElDJFy5Q5eyalK00Mlj+HyP
	XwfOxJVf1pHvA+Zcql5s1vMo5f8vVly/eOI5QdMJkfhkrD1Dw4W5VyGb2d0AltULm3WuXj2ZvEX
	UmmhOuAfEylGdGYL5NKJp4NMZDkDTCNjc+UyKNuUV4EMC51zQtOw+wdBNSMeiI2XZEpozbOnHZa
	Y/czSNvf
X-Received: by 2002:a05:690c:c4e5:b0:798:6c28:dd68 with SMTP id
 00721157ae682-798dd7b6080mr15461537b3.54.1772798917701; Fri, 06 Mar 2026
 04:08:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302071434.311395-1-sun.jian.kdev@gmail.com>
 <aagWYyrrwUt-poL1@mail.gmail.com> <CABFUUZEdbCMrNyp4kEO7A4KZPn5TKi48+tQvaaYaYuJj5FQ7gA@mail.gmail.com>
 <CAADnVQJfDYiBHa4f3p_7MpURE_a33+atRbjbcpZ0VmrKFaKkqA@mail.gmail.com> <CABFUUZHv2a0ky84aUKcqvH3o8x=5jpUtZMW=SrrNiD392e0sQA@mail.gmail.com>
In-Reply-To: <CABFUUZHv2a0ky84aUKcqvH3o8x=5jpUtZMW=SrrNiD392e0sQA@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 6 Mar 2026 20:08:26 +0800
X-Gm-Features: AaiRm51dbSanTdO9G71-TpmCeTfraSWdfLYC4SCnDtzDoPQs2iyJdlyJ6-pndQU
Message-ID: <CABFUUZFYUrhk4+MYDHajcHr1rU1jKCErw3aqHFq+Zh2PwB1Zsg@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump
 complexity limit
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Paul Chaignon <paul.chaignon@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

v2 sent:
https://lore.kernel.org/bpf/20260306120024.1032301-1-sun.jian.kdev@gmail.com/
