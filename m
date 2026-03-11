Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA9175A99
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773202221; cv=pass; b=gKIC14Xbj0tCvw9yXNrQGQTVWoxT2blSfkGjng/E+VGY1d3zWr2MNxC5uujD3p5LlNPNPxauY1T2/Xhfesp5M0eyuBgzzt4rd+TTENjZya9Jff88L4y8roM5GBP5L6ZczV8HFWIu3AX7DRvZZ4Hr45UlZrVmIsjR9P3yQuYbs5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773202221; c=relaxed/simple;
	bh=MBEHeJJqSEBgW4Nd1+NCcQSg5LShs4baZxRE586zPOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJRO+ZVSpbelS/16THlKvm5zm7Ec44Z5YcHbnJdMTawmmoh7KfrKQniE+FO4X+/JT+sCViBgdVQSniUNSDJlW0K3uzVLuY4uqm0VFnRBs4HKRNujt9Z3J4aG95h8UtzC9SFxsmNanyL8Q1liM1Phw7M/RnvYr/YULWv+IDgiYRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IUlCSaOY; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IUlCSaOY"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12776bebe9fso799194c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 21:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773202218; cv=none;
        d=google.com; s=arc-20240605;
        b=Nlvp/jDEixlMa5xCfi3dq2U3uPQsK2ikYiJG+PeVK3MGccH0jW0fiK326zv1dtWSNa
         oUpSF74xwIPWYYqbdiwokLbyeO6TW16IovzsWNCn/b0j7l/cTbRwVB5V8oRJM+Wnx3iT
         oxMrHMXxXc0CqEJ1tYCDR4+6NO5G7G/ddGcy9O7xmlq+QiY1QKznPSqqYx74jNp8jftf
         XQKx2PtRWT38iOkAe2xwSApc03T7tx4vAmRly3pZ0fmrm57/r5wwNm6UEQccsV+jafTr
         LRXhmOE2iMO7kM6N0OHItyJjCDMrizFJbsTiqQNIVQQSyY4S2umF+kv+cNPKb3brkrK8
         ZHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MBEHeJJqSEBgW4Nd1+NCcQSg5LShs4baZxRE586zPOM=;
        fh=gtqX1tuJe+MNojx+SQYeL1K+9BmVVUKOLvSQB/5rpmM=;
        b=JFRkRztWDqc7c7M6AtvcoXSuMHsDrYff3d77nytjnxy4j6fI4VuPXNMkJEss9A4Y8m
         jkS50NcUBOr50skfW+WtVyN6N6k3YyB15O57IVSnc2xv5AS768UJEZ/OxNh/yFDW1EhR
         Uzm52za9oxxIvLAUW3OdjOF7n3K9zfqvd093NmdCxs+2zwG75LcX6Fg1DH0CEs6XgpN7
         /7OYQeH2aQoCLuRM+RYvJWWkChA1oY05the1RtUU7Y2KugVavLd8zJCl4+hFlaYUNU4n
         qhjGTVRL6dECHxtsrDRhoCr/G6OebNCZ2CSVNDj7ssCZXVbkVKBLiV8Of2r3N1gG6QJU
         Mdxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773202218; x=1773807018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBEHeJJqSEBgW4Nd1+NCcQSg5LShs4baZxRE586zPOM=;
        b=IUlCSaOYcDYoSvYKTPlStN2t5DPJi4OYzPrBd7EQtLELTsckelsLUKoBmVLg576/kS
         CKwK2yIwIpfkN2LaHN7w5K8PfKyItbIgfKGLGHLo7wBPdfOJGTgHTqvsqzF36fT028I8
         YCc5I0z9K6tJhsM099yGsoQ0Xz/OuFLY6AQEGKdhX+gUZUpe7TRcp/sOnb2N87tVo0dv
         /5gzpFdb4rPfN4oCJJ8tbFvhQlWFp34vtOx3KOnZBkZFcR6iKJAQGRfhmc/os2w28yNj
         5EnLVmNzDwxE5RwtyQwE36zILmH4/npNDg1aYq1ZloWlYOS3Qe0cLM+8FVw7WqEkhpOW
         9cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773202218; x=1773807018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBEHeJJqSEBgW4Nd1+NCcQSg5LShs4baZxRE586zPOM=;
        b=BCqSC93MjPJJxEBbDUZcVZZwMZqbfxT/GIkAms8/FIlhIwgeaf943R6KavKkZ9Ri/w
         lzUmnEJ4vbufZg0/8vdg4ddNRZ5wYjej58al/OD9F2UzWPkej5bw4o6wRixsYzwsqWIJ
         pwIi2C0d43R6KhTWYOV4O4mETIpVxfDz5pPJmynK0TFw7x/30y2N5RqKoiqLIWJESxrU
         1auA3MAQGGSJjgjCB9z+cmqnr6TvDCPl4Fu3sg1n858ziAvDz3LAoFSRNks3JEJsgmmj
         uHdJdFJwIOZ577EnLwtL8Z+V2GTBsUkV1SOazNK0taIYavDO2+nXnJRIQzmb1Tq9tCR8
         d/rg==
X-Forwarded-Encrypted: i=1; AJvYcCU2O08aDMjt3hEKk8dvUgjtNMb0mqAp18tA/bkmG0erZRoHrcvn4ONiRzdNkcKx0UF/349ugMzKVQO5dSsQsr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziPcV+nBapAaOIIhhcjo9wn5cXpscdhY8oE2H0yq+ibdFaqXgQ
	jeRUESqnMauWP76bsG+m/mQH7EYZ8HNHMSgkQr2kIqBL23CGbLsfKNbqPPSb4iniJprTNhr+04b
	NdWwEhW7icm41FPbYmiGvNhJV+kaDPrvCakKa/B4u
X-Gm-Gg: ATEYQzz85QTA6psVhQZKCdJ6V2C8TI09JwDDdYWB7VrBxdA5OyGed7eriYGw/0ICWaj
	g3hgmlgup7/27eiYQAhyDEV7C8AVlDxFHRFBAQuOrGA32U73CvEUtY1/1PK7aATe/ROA1DHh7qx
	7iydzbV3Jl5US3efO+49pJL0yUJm4MiPunMC/B5eVDsRPH/mfFvhxHi44v+X6AVh+Qf301IXP3X
	0IFAxT3MEYpMxvqj99zBfkWqgw0/gne8hZl9J5pOUgTw12hVh973+/HCKL8Xf+rncukfAnGHATj
	Gn7fMj8TundLVjqEofCllsseZhoUZkxfX3mTOYXt//l3jyLeXBRCuKAtY6K1Bncb5oFD2OQ=
X-Received: by 2002:a05:7022:fa3:b0:11b:f056:a19b with SMTP id
 a92af1059eb24-128e77af41emr591178c88.18.1773202217272; Tue, 10 Mar 2026
 21:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772894876.git.sd@queasysnail.net> <d28f72b5b4ff4c9ecbbbde06146a938dcc4c264a.1772894876.git.sd@queasysnail.net>
In-Reply-To: <d28f72b5b4ff4c9ecbbbde06146a938dcc4c264a.1772894876.git.sd@queasysnail.net>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 10 Mar 2026 21:10:06 -0700
X-Gm-Features: AaiRm53pv_QQgxejGOlkcf490qHoypqLXDfrkM6zmrqE_kvKIqB5u7SSItGllIs
Message-ID: <CAAVpQUCF2bLS98J5HHg4VVPMpuYm-TncZfFfQ8m-D_1mLRpxkw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: rtnetlink: add neighbour update test
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, David Ahern <dsahern@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 2:59=E2=80=AFPM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> Check that protocol and flags are updated correctly for
> neighbour and pneigh entries.
>
> Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
