Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E8345CBE
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704646; cv=pass; b=SVga24e8OHGj8KV4sY8ulZWo4eBQRMjHFVvJFk1gwMValTzc5bbII0fLAXRolsUMGNjNAEI2rq+kjPZtOFr/AsihsXgcmQKclDwMXFhiD1i+EqS2xS6LQBmTK0XlYqXrs0mlM7aEXSsIpnBHa9Gkcrr7+vwSnnL6YSiK330L+N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704646; c=relaxed/simple;
	bh=WP7giIq6JORl1AU1d3jmZFpFIM0XkPQ7s5H7vFgoW3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZB5VyjhvtEkOyacxrzkhCIkY6AYPTT1C+YNnUrSevUn4ifIJGruKNyGgRiWH8aduGL/JEFRYF8ZQF9uTPi6CZgObg0JH/FCRTm6m948t6VZqGoZfPYjzwFJMaeGdLzAuyCnnffs6wUo4l9JPwBKBap+Bk5QggTqLp1fDcDgYy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sud/MdKw; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sud/MdKw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso768191f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 10:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783704641; cv=none;
        d=google.com; s=arc-20260327;
        b=LuRGZ7OLywWrJCxo9CHi1ko8SXTza+UdZAn+5XjuJqsTNgM0axX36WiuJGmKtZXFOy
         3fA9xwL9wJzdYBeuG/hbNRZfMviaeVN2zAN80gANbqICwjtty4HX+PP5q1y1CuB7/Ljf
         EXesZ+8LsiDbTIzUnkznCjFtGrQJ0tnjOWXONWMph0se98Qi2DvcD/OQsSeAFRaXSQlJ
         E7g3ldfIprB67U2FOh97ALAwilIjQZYzHnbGBywYuqcVj0SQ4Zd4nafdu+fUk6Ew5yio
         BIIIHmk9c9Eqx0BPn2LxvhTVSOtgznTOhTKqdQW9LAV5DgVN5sv3NjOH0TdJ7Wvm3B13
         VpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WP7giIq6JORl1AU1d3jmZFpFIM0XkPQ7s5H7vFgoW3A=;
        fh=pU9//w2i2YOC0eRQxnWyBN87LbmTYFGOtUCZGnrDbUU=;
        b=ltBUL/9LMw2mFkUiDeOFP8fWXS64MDjlXpSB9DPQ9vsPe410WxKyzAO/yJm7yNiDd5
         YRQscfJSkZI1zgKoOWcvsXh/E6uwj1LXsooNUc0m3QPRwU0cRSrap/lnMpvgnL5iXbwc
         Kc0fwKskrZV9JW7wT+tEDKlF9mPO0JJFxqt2nKoSv4EQsofKrLFDirxYi5BHgifxSDRB
         sWgzFPR68CzEXRWWBFLetTrfWqKwQxKIYTnkBCh9tSrWJCbzyd6I5X67VddbWVRSOY3X
         eZ08NJ+qe4FjQGziYkKSuW8QawqiPNzXUzLvWG+j3U/XGONoabJ084/U9ZrCwzjemKRM
         BmDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783704641; x=1784309441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WP7giIq6JORl1AU1d3jmZFpFIM0XkPQ7s5H7vFgoW3A=;
        b=Sud/MdKwBO3/uo+uCB4GlvVspHekxy8IYFzuVkmQjWxrl3tRlQBSG+VVp0+PAkA4ff
         CwDZ49MBL3z/YNzl1qkm5J+041iRF1LfMTJo6hkWzvaZhUL6aIo1yjE8rs3Zq/EhUkBo
         /UFdJ3WoBRnhgs1fPSbLr9M2NqdnMVudoNdQfZpUM6P7WpwyZRYt4fTMwUIVFGnBLuEU
         Fv1wAwBZOhGpX2HJYILO8QVtbxZJEQKnqEoJ6Ds+obT99xKEhLVGYzO/V4NRwBX0Fb/z
         oHz6necV8WfCFDksDA/u1EEXULxXOWsMJfQI9h5hH+p+DzbuH2w5cYlyzdbCIurwHsmi
         GNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783704641; x=1784309441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WP7giIq6JORl1AU1d3jmZFpFIM0XkPQ7s5H7vFgoW3A=;
        b=cBQkFfM+hH35RYQPeZQlM8gqGSn24vD71lXf/mabCu6dcr7Y90tZJ4h7Fxob0PgHQg
         zWvzakbIpAoY0YNkLjTYLfGBylMNTYRASwQewOusu3wPliaykhV0GPLM1o84K4aB1Zc6
         KlGfFBrb9/yBJrrpxP01HcH6h+kPaXO85+XsTauFCttt1hXR8X9HZunjKtCfQdXWTazM
         qaWkW0qO2AJWegpxEgYgv7Tca/Oi5i/K1/ib8R6BqVMRoHf7BSKkvR5ktA1bPud0L+PD
         K0y3POXsZ8U+4iIRpMGB2s8tN+OUo64F38zB+C6HqEWBANcGwUtOu3PgDku/pM26deGu
         OaBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4634hOGyv6sbdSMk+01TMHlXGF1Jxs//N94HevUOndCF8yvQ4Q4NYnhiduIzpby4Hf3pIJ9tXRx0kQWxM6AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhM5wMKB4+PoAtyEME2tbZ48DXnt59w2RveP2WlWjL6bpCxG3
	88WGgn4vubBzZhG0a8VPUVpYMh9sPbNFfN6AoO/FQDp+Y6yYYzqjvKR+5T3VPQ+uEXZ3zZWhG/S
	F3yQYtantqMNxl0B19oWPBEBZzDE0BGA=
X-Gm-Gg: AfdE7cmkrrwwEXAS6jf5ppS5tUHq/fLCkQVQiNm0OAJSpdAZfI6Ra5/Gl59QNAMvmLC
	E2ys+rkS9T5+CVvkXVfJhGGq5FGPD/ACA7kN/1grYOPOX112M6xL5Qj1Jzs7zVlsX1+7vL0CClD
	QrDlqx9baPuGPzeSPbzpBzvYy9CCYi9a23q0NwYH6IO68wIG3sow1NvVQHkkIOYESXK5nAO05sb
	sCQgTeinnzEPNuSxJDxY7wefLxZJ3EZBOQyVSzAchu7xcb417+O8GG+sFuliH1hodSHkJLulapW
	wqxUNnwJWdSd1EActZZgo2hbQSQWc5xHTvyGg5w=
X-Received: by 2002:a5d:64c8:0:b0:47f:2bce:6f38 with SMTP id
 ffacd0b85a97d-47f2bce71f2mr1605932f8f.28.1783704641136; Fri, 10 Jul 2026
 10:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
 <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
 <CAKEwX=MMXdq7KTzcEgXfNt2L-eTmAVa+nijdyiujVOAhXQsHSg@mail.gmail.com>
 <CAO9r8zO-nAys0PJfXVRwLgAzwJLa9KxpMXKQKXJR7cnYKgmhRQ@mail.gmail.com>
 <CAKEwX=M7axSs2FJDq0KF3GBDpd6G0J=gP_2boUJraNf8M2n3Bw@mail.gmail.com>
 <CAO9r8zM8qk9g6+B6GiCV3oytjViMTEhbr0KjrccU+bF4+PMfTA@mail.gmail.com>
 <ak6c2TaOlcGxZ2Ih@localhost.localdomain> <CAO9r8zPiOyri2wVxRvB0bwEXf9bCKoPsQmRzOpj01XozA8hqUw@mail.gmail.com>
In-Reply-To: <CAO9r8zPiOyri2wVxRvB0bwEXf9bCKoPsQmRzOpj01XozA8hqUw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 10 Jul 2026 10:30:28 -0700
X-Gm-Features: AUfX_mwd51QhDhOxXEqljZbVmcwLnRoGIaPgZBSLTfEB8WOHhjbjcuIKoDcPaYY
Message-ID: <CAKEwX=PLauANTu8nDLbDmViQ6u9gvh7HbKffUAzUXuBa6Jes=g@mail.gmail.com>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
To: Yosry Ahmed <yosry@kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hannes@cmpxchg.org, chengming.zhou@linux.dev, tj@kernel.org, 
	Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 12:08=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Jul 8, 2026 at 12:00=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.=
com> wrote:
> >
> > On Tue, Jul 07, 2026 at 02:49:56PM -0700, Yosry Ahmed <yosry@kernel.org=
> wrote:
> > > I would honestly rather use more memory. I think there might be cases
> > > where the flusher is delayed. The flush being slightly delayed is not
> > > technically a bug that we want to see a failure for, but if a large
> > > stats change is not visible that's a user-noticeable behavior that we
> > > want a failure for.
> > >
> > > WDYT?
> >
> > There's already the (recent) page size-based scaling, so the idea with
> > nr_cpus scaling could make the selftest useful on wider range of setups
> > (even page size can be considered as a slight implementation detail
> > leak, thus the justification of nr_cpus dependency).
> >
> > Also, I still think that internally the threshold should be changed to
> > the "harmonic" formula [1] but the selftest can go with the linear
> > dependency for more pronounced effects.
>
> Yeah I agree the threshold formula can be improved, but we need to
> make sure performance doesn't regress.

Yeah that's a separate discussion indeed. For now I'm fine with fixing
the selftests by using more memory.

Is there a good generic formula for this? I understand there will be
hardcode values, but at least making it scalable (by how much memory
we have, page size, # of cpus) if possible? :)
