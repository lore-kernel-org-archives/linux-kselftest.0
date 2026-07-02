Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50C191
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950475; cv=pass; b=ddNrSSC9Vt6l3iH32dUDVAIK1XMbysmsvF2skx79mWOg+A/hrrUc6VkHSa8dEPnSirmaky+RFnuIoODRV49w7i6/clpvDcqxpCWAg4+SLDBcQnAj5szD3NJROZeql4RQjsSF9BFzDsUbdZz6zInweQsktumC1xVV5KzxVt2rwh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950475; c=relaxed/simple;
	bh=h7F8Hea6IuFuXhEfwJYVnVQjGYALLY6z0SeCgrb7pFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T12vbgIlRXvTMcK9BSco9jn4JMVkhd5MSZ4EE5yTXIoY1MxkT9bLYU017UxMOwpLFuwS4z1YyGp+7b5zlM1Hg8NK4B3lWRjMWxKdvHMuLUfulFeRaSja+3lFSiceu5Bj9+8eMlLF0ZFdHUMiIGPa3YBV1P69zH+bp7eRSX2ifQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyoXQ1EE; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyoXQ1EE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so583339a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 17:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782950473; cv=none;
        d=google.com; s=arc-20260327;
        b=kHWmljSkver/aMQXnJXBcNHk5uN13VImQsVRpj3xQle7CVc2CYqkRnpSTUvTLEXqGf
         r65ZVABG8zzt5v7W3sK1yy0Iny2B9oHiFuuVnQhvaXLZppWKnlaA8goVH/6ymcQZ4RIv
         tpkKaf4+tzbd+Uq31djjEitrjyNJxxwFz5aQdlUei/V5r/DdaRmI8c8YkvgXb78pm+NZ
         ZQcaLb82X0yBCt1c0eEK7ct4gpWo2J9XWqrmovelLhg1764be+MV3NJORujyvxeD0ytC
         M02dOTccWUgZwjh0TNW6h2Uo6+6UWNU4qf0otB7EZQjJ2AdTzWpTCOCbMs7WuJtLtnEh
         QnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h7F8Hea6IuFuXhEfwJYVnVQjGYALLY6z0SeCgrb7pFE=;
        fh=OUBiKzd9cNsrB+QaYhvz5k+2FfDeHszqIO/VXcb84nQ=;
        b=OUnuWZA5qogCBZtHY4MqUxsY1vHulp5X1WRqJdlyAVVdeIOncCeiCOL46rxmbQt5RH
         NxRiMlVroNJDdzZaA5TkaltIb3JEwfano5gVbFCOAocYIiT+443J14PFLrhMPqZGRbOs
         SzIAs+uhieKklhBArm0EwxfwKK3TV7GP9f5g9VTjuhizHktjBrqJpfYrocTtOum9LWoj
         vBowO2d/EeGYBnL/jlE1hHQFc/KqUullC9uLGwHJtbeHDkLJr5O2S+y+Gihqc8XACURI
         nXjMWZC6ftbIpjy5NFqwu6HRNzuYbTNGqN5czS18GONlG22H5pA0wqmrw97IRt5LN8qF
         2YYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782950473; x=1783555273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7F8Hea6IuFuXhEfwJYVnVQjGYALLY6z0SeCgrb7pFE=;
        b=lyoXQ1EErjH7PjP3Ijggvk+B4EADZpMT4ykcRN6Eo7bLcgve7oHwh53RNh+YVSEUvd
         huK1Snljy7Drp51UsgxlrMyKd8lpnxAppnUnqVwDjsHfyyhE7/FDuKe6eFj1w9eTH2E+
         DRbeSNlwp6kat59q2oWWWXPQPUMlwkI7MB61So3K+GalUrsj8s2wlvkcVJ/XSFI8rsEs
         FtF029G1RE13rtcXrVqSW2BdRsYT6DPSj/zB95rhS1HohKdT05C+uxkvoTfh+FD05QcN
         Sop1OLHXBJykSsQkybEz13ixvi/b4+CqlgeSF7bfVpCRLR9cCfCzwv1IJXUUNK0CAdnm
         amww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950473; x=1783555273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7F8Hea6IuFuXhEfwJYVnVQjGYALLY6z0SeCgrb7pFE=;
        b=pwdbIEbhPKpJivrHirSx5s8UxmYLUjxk2Q5RyH/IHzkuMgyq29qWJATFohiIkpygYj
         PBW3aqS+sf8FmJEBaqm3pCzs+3trG90sY0wdfz0nKKuAUPIYs5vnzCBNuuB4/9YbXH+P
         fzfA0lxA5Wkouf8eLUbyBkZdisY/QUiADT5rN0+gpSoQMsnQqUstwUS39YlIqszbhZ/S
         eb31PeetIWvDpnOvQA4g4Aur2lnzr844nU2VSe1kqJHOqvewSfIcWdtfs4KopJUYl8PS
         eHUzdCK7qfq1bFicvakl7p5QU8VimH62fOZy16pL9N7DIr9tCi2+q4qbU00bI0QREfcm
         h1LA==
X-Forwarded-Encrypted: i=1; AFNElJ9cwE/BxBWV7Xhng38GUHELrupK4fPvsDjrMXtYj7iQntUGzKPijFiuDIAJ/GJrl+GNaw8+DgbcL/okM4g0+Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhGgm5Aohlz0fMIgoMBoJd4B4PNdrW1kmJt2yqMied2ng3L3p
	/ha74DmH2Cz9x3EXMpEUZo6HFDPfcosAubSnb9SjyJI1K/EvSZkTsYJDxcq0qYtbgQSn7wGKWtH
	rfW1DYcgc4ufHPSqSED95YASc5a2bpZc=
X-Gm-Gg: AfdE7cm9fLsYnH7Q6M45b62oZ2lffaQb8meZh+LRHGJEBrR+FiXtWFDWlF8UJN1Zu+7
	jjFuvpKYi8hdZT6ZJakpHSwgyshj0JxAT8XN5ic5HQLATvcrQU3D22onqK7ZuWUBmPcarQ4ZXOW
	pKGrM5/yIJZOY/kKEPZz9cWInIpEdzuU0IOyzqfAAjmYcLaFBi6xQ5Nlul39tbp+2hDcTu4mpyp
	yu0u5t6CCn/ISACG2H9tJ92OJOzAd9DvQZ+fe14KUsPlV3qIj4JMN7DSxiKA1rf9ei2kO5tF5lq
	V/znaPK5ptkqDceau8/Hpqsi9IEyLiw9owwPUAbH6mfaqfpAptvz8aqJeQ/x9PAMjlGX2IWNbJ5
	6Hys4fAn1duf4uw==
X-Received: by 2002:a05:6a21:6f8b:b0:3b3:26aa:5455 with SMTP id
 adf61e73a8af0-3bfed15c303mr4004694637.13.1782950473171; Wed, 01 Jul 2026
 17:01:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <178291352217.1566898.14481561093843379745.stgit@devnote2>
 <178291354144.1566898.14374948740441958770.stgit@devnote2>
 <DJNGE5JG5ZY4.FEO5DZ21TL7Z@gmail.com> <20260702074007.e1047c9d66cbcecc7d4ab3a9@kernel.org>
In-Reply-To: <20260702074007.e1047c9d66cbcecc7d4ab3a9@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2026 17:01:01 -0700
X-Gm-Features: AVVi8CeNxG3GffX-OwXo6mb147DD5vMthLu_C49lWR5Of1AKIMhyjJfW9B4eScU
Message-ID: <CAADnVQLUniyTM64gHrLzgjWiNZTB82tT0LCxh8D29YfXG7cZ6w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] tracing/probes: Compile all fetchargs into a
 single BPF program per event
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 3:40=E2=80=AFPM Masami Hiramatsu <mhiramat@kernel.or=
g> wrote:
>
> On Wed, 01 Jul 2026 11:41:26 -0700
> "Alexei Starovoitov" <alexei.starovoitov@gmail.com> wrote:
>
> >
> > Nack.
> > I really don't like it.
> > There were days in the past when the kernel generating bpf directly was=
 appealing.
> > These days are gone. Performance improvements for fetchargs is not a go=
od reason
> > to add all this complexity and bypass verifier checks.
> > bpf insns should come from user space.
>
> Thanks for your comment!
> OK, I don't mind because this is a kind of investigation project. And som=
e
> people had asked me about the same idea, now I can tell them the result.
>
> I'm satisfied with the current outcome, as this development process gave =
me
> insight into the implementation of BPF and demonstrated the potential for
> optimization via JIT. :)
>
> And also, as noted in the cover letter, the current performance of fetcha=
rg
> is better than I thought, and is good enough for debugging. :)
>
> BTW, I'm also interested in calling the verifier on this generated code.
> Even it it is not merged, I think showing the correct way to implement it
> will be useful in the future.

The whole feature you're trying to do is imo reinvention of the wheel.
bpf could do that kind of filtering years ago.
I don't buy the excuse that embedded environments without any
kind of user space needs this facility.
