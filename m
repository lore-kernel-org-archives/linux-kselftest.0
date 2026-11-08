Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175628;
	b=Eugr2p3n09sz8UQtUgeTRz8yqTi70xhbbhVZUFrnMqCVjo5x06mJfRgTD+0unqQ6ukLW
	 APcYkeP8mcxxCS1vuiZHFAHIcMfj317DMx0qEaT7txoeHNBWVZkFN7lBegdwAq3cF7RUA
	 sZ77tJE05YiYkBBRqLV0++U9Y2uTi0wqfVIPoGJ2D3L+GdgkrVxf+xFBvpfEi+g6DSSzN
	 SMZ8FhyQttZKYEfoAR69XiVob44UfWGhDwi8oHsd6H2fvXonV6JlhN140jAl0JqBqsLkY
	 6eAfTyghx8QlNF/pkyykY5bmthT6cH6v1BCKlC6O+/qXp4xnU7rMV4U/XnSqE/OVNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
	b=2yGSJRnzPfYTyGRgcMJzeAUK21IvpcA9Y76bgivgZa6zAQUwrSQPTkplCZXrMaq0sLw/
	 ClT3uhwDlIynx+AOn7bV8S8/VDgi24jzFxN1N/1xXNY9qOB4zG3FH/A063gBI5BytgDhl
	 0IisyFj8rvXlb8rSHNbixIghkjtcVXUUO9LHfn7+lFHY0DucQ1dvAEgxPjdZFgiRA66Hm
	 MsPDx9YvY0WBiFo0fUh1RZ7vbe4Yssm4Z7XYtgzqQAPxkkGafkUyaffZCLl2sAYsJ+fzZ
	 7wWwOCwLrs8ncNRiWYv6R+Yc0tlWFgzaQgTs7mKYXfjU6zIBMCBUWzbPLcaFB8nSsuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950C606A31C
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 22:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7950C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f2f2edb19so26030285a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175627; x=1794780427; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=DMkSfkrIvh1J0HmyqnldyergtJCpVvzbM5wCx8OJ2o23lhtd7XoP/mungBoCmsSuqV
         M+rYApkY8E0axtbaa8c13yvk09njje6q4WLdVpJlBRrKUkSiA5bVzZwBO1ycKC4sqJIB
         R+Nkm8BWTmhQ1/h+bNlpkJ0sR92QwIqusM2bsN8SVZr+JR1VvGLQqBKIdo5z1FOoj/OM
         abdkoH7n1mm4fwCKsW85apwhJYw/e2R3cVgrjcPJxPubj9JnXKEZ427TWvB9z3Pc3D6z
         6V7XaK1/XyDyfSxMPSZ5S1XB3652vVtep5CjHsJygTDjnHK8tdBGZOY0VaHvLr8eor7U
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175627; x=1794780427;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=easn+3rJenurb+0S+ONpTzahWAe8Jb0qeTuyukZ8yqGBnCW6rDc1ZBVjoNTgrRPYso
         G5kZWRDlu7P8351DX+LPpJUt1t40xQLktfGbY0JFOYnApqif18Jfhm/BPC3CvekdnLnU
         aI5Q7d5fTKObCulZQEJLuhV5qctB+tazGs++22tCc/Ft0mBNE+XcmlSc6vARd143kwzQ
         65wsAqLIEgImwTGPByrvasEkc9IU86Jy0hr8s7tNOyBbqc5rTgwX2AbVpfQhEVkH7uix
         QaYF+sZddcKmruJEesNALbz6yZ/dArhYfe0aApQ7zmsGa1Buv0uEnOliI82t+5GRgRwz
         Ptyg==
X-Gm-Message-State: APuU4Z+GNgTs3m6A/1BRn7caI6cbd18km+OyxsK6eIBpCww2iOG6PlPO
	Wv4/1mDXf4X7xEkRAXyUJJK3JPwTP3IzOFEjB5P8QVl1KMbBr4tJzD+fqe6QXKo=
X-Gm-Gg: AYBFou181hafHgEAqHJajb6FIHoGM1bb55Iddh625TojlFgBwyJ+mvdfkUocnYHIrwm
	tA6nokn8I4vDFLJyIMsc9xsWq+UgBDNkCR90AtrtGrK0sZexnhT/xv85Mzupv0h8auaUztVZFed
	8HfVsgZu69Q6qQJI6ruwoU/+xuw3V/iyMmhNOC2ooDFEJa0Gw0KlEVdinbyzETHNHQQ1VxdfAUx
	D/ajfyqHtH2dyHgBJGzZvfk4VVjjWlaqGY0oTpVhxjgL4lKTtPsTsoNsflPa0jbrtRZeci/U0uz
	wKkkCgF+W2KXZhXOSdcrBu0XDXyLyhTNrvcAXXfTYdANdSUnnqOqyPn9oGsM5bunDuuEbQXARIF
	02QBPN9k/UOof8qTz3aL0EKGW7V54QninLhBBcHzHt5lHQMh5W11L+RbwUFO+GjhZZ9jwNEo/xv
	+ZkZ7kZg2CAiQcTh6ne7rnTip0vxpHNQ2F4UjEcTPdPBuk9r8ex5Zx669Y5iJ99szB243d1DrzZ
	NzW1iooXk4rdVN2wHbLuZjTu5WGiWgS3S3AVjUoEfV/DJj/HCEavTwc3xXcKaPL8jIx6M/Fpegw
	ros1buDWo1aMm+J461UKRmjTsjiGA1CXNbvR61n1U9+yaYNI7KAkqeGBwHX9Lupk2KBM7m3CK2c
	A8NR1H8g91Lr68kcn6Sy1qjDHPuF14XLUGKhEFKPzEvAIVQEEVp00oeTZd4EyVhMCr3ZU55s=
X-Received: by 2002:a05:620a:1a03:b0:93e:3824:4123 with SMTP id af79cd13be357-947848e90admr386631985a.65.1794175627456;
        Sun, 08 Nov 2026 14:07:07 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d93650sm306944185a.23.2026.11.08.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:07:06 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
Date: Sun, 08 Nov 2026 22:07:05 +0000
Message-ID: <179417562518.1641291.6757389780804092916@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David, Brendan,

Gentle ping on this v2, which has Daniel's Reviewed-by. Is it okay to
pick up for the kunit tree, or is there anything you would like changed?

Thanks,
Eugenio
