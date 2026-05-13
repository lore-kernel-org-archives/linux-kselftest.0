Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699837C11F
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 03:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644261; cv=pass; b=GB7TuA4A+M4BPVvL4/edPGD8yi5g1hn6mK/uLAUYlvU9jogPLp5xykexPH65WXnNHCxUq2ayY7o0fPRVjiPxZQqffYz0mwC0OeKU5wPauy1zZiLvaJ400ZlPZjNkIOiMvlxZjWYFXIPQMW1cFt4X7Yom//o58rXJ7t/Ng2n/xps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644261; c=relaxed/simple;
	bh=ySuOWG4al6XqpgWWhWblWAhEAKrZ0xPYXy7Feh8cyFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfYJON3lKYY+qvljCEK8vY4MJrS6Au7Mzm5uAlL7mDfodaFoBCVnsPZTyF7dxI/RRXHqu+JsNY6gDfXtznQmatdoLGjvTgZK6CN0cI4B+iLdKCjQKHv8rmdjL3pclSRwb77z69Ntimb+6jEpbCwcjDH40MPZtGQPUP1q05GfrcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cR71oiUk; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cR71oiUk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso10a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 20:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778644256; cv=none;
        d=google.com; s=arc-20240605;
        b=WnAskA3Lwn3SBJI6X8KPIs8lBjbBd/qEU2M11GdPDoaaA/hazD0Sv6Y7lbiGanzre5
         EAxWtdWudwx2BFys1BtxRXSe83jDdXZVmB8WoBwbVhDxLamze9vIKVI6g1UZXrvWSFgX
         pacHkt3fszevTgcK5/s/F4FZM90AJoAfju8U7gxjrgKHrba+aKKUe2c8ClJB4sQaYl3f
         9TTqHte46Ml1q51gOlDH6MUWDG5IeyX/2DzgFVDD3HHqVaMB54Su2cFkYJ8MABESdT/o
         YtThuf05UwlK7f+2a2ekzA1NwVuKK8cdzl+u3nVRyJdqndT835WE4h8pFDZ1S0Zpz4H7
         3CeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55D1DN5rEuWPlm48vc4v77aNlbyIDswld47F/9dkAa8=;
        fh=swKP7cGR+pVS2Rvt0O/QFkEveIA5RfxfCPVu2KFNNxg=;
        b=cWQpywzcVvqx9x0KoJJnvL3L6TcNbr4vmRhLLCzSVnbZbU7dIKsUFPNFFHr71LuvgU
         5Jk/w6sNmefql7sANVGojZw+eiADPyIU/qgspkUtGPcosRq3ZUtgAkdJj27dGdb3MUrF
         nuxbOT85wfSAuZGkrOdUnznXt5Ib8liOTwONmiIRgurtBAJPqXmIsRWtdGZQNxpTm43d
         HySIZ1GWEIyWjIPCSc245ZQDZDbNtEVHInilNNuPuWXSJbbzSGRpEXrOhG20mxTtd+o1
         V1ptc7Knxs9MVXjv3cAku2Kr0nA/B7juQSQR3/DmS7QNeCTWD7GYe6a5EzFlHuHWG9ji
         Re5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778644256; x=1779249056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55D1DN5rEuWPlm48vc4v77aNlbyIDswld47F/9dkAa8=;
        b=cR71oiUkwqtCrtEipaBtIFJGV0xPTbiheFEwiUrk1wJ1Yzxl8W/SyOS/D6ykWdxI+f
         baI+bmDXnT7Dl5cV39N9MgcnG3luhSmHIUFZBBZpICReETIyTIZFQ0tuA+7ZKQwL7i3F
         AR4fjq0JKLfS+nPsu7S04673SDtt0bmEKosWGduU4/CDvAdqf1EuZOMJlfVg+3QBDdmK
         +GDXPd60WeJzUE8TQTy8hYu00igZp9tkrkJ7p+A1Uwx+Ol6wwOXY8LSrGdU7+v1+l4vQ
         luTn/RGzlhhBmxIPtHW2+SomVI+os5kbM1FOdBupGafzaDw6VAvt26ho1si+7vLNXmRr
         3lKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778644256; x=1779249056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55D1DN5rEuWPlm48vc4v77aNlbyIDswld47F/9dkAa8=;
        b=T05VIKzi4KbvDlbvebF00vQn6y9NclANHGz9IWYCBXga9XqdrtEkjdQA+kdlZ6Yzgv
         XGm7xaN3m3L0wdD+nkj3IntqUt068DWupg29BwVVTp4+E5dpuXVBaV47+QNjZiXAodFM
         jT38gNOijEjEeQYN+YLOLbkubVuFOOUswTaDkyh+HamPKqfga/UJGHnnpulxluIMuz86
         zcxU3+2YzPbyjOlRros3yOAaMUMvaP8kJdFGjdwMsO1RB8+5s+auovnrDAediX8tUop/
         DRnjGc8/FiE8oYG7lfRx7VyRa13Wy05v2A8sFyBQqMOXT0PjelRgG2nRcVPNmWZhxJ/5
         jDVw==
X-Forwarded-Encrypted: i=1; AFNElJ93/QfB8Kk+86A3J2f37Osbck+M6aHSH2Z7t0XbhLGvYKyXOSdpeWauIB+fTSmhvHY/F9C8MX2Qw8L026Mqgxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUW1ZdX1jZHMFYa+LX93gHCDePswNzb8UoXodyRB+qECmO2ip
	FONBOdcndepTl5PJdSu+df7lpiel1lgJmIJ8FV2/d5gkKQ7DSrVEY2q9ROH6le3sCfDQy/fgjk3
	pb3O18J7ag8qx1M7gt/ALOZIE1iAh1x8u+opSHXo9
X-Gm-Gg: Acq92OGTz1aMMOgdyy/i+ruV/DZPZCUf/IkS1NKLFq5aC3lUSf8/ZmoFLzvpkAfGDjf
	1IkZmL7AkWL97p0jSf8wMYMMIUOhwsMvauE3W/dirSlPk8IL/YkcF36tBXxYnJoQlMLWyK1WwfG
	M2r5u2EmscOH5oOd8DN/C6qHTcotWMR/1fnoB4pD8KgjmCy9AbQVq2EYjAdftRi6Pk/Pb2Kq+QV
	JYn0hjpE38ByJikRy0Rh+wsRp17qepdR0+XBs8R2NmjQdjiBUSWSSReMwcMROC6m3uaPwSEQ9Cd
	tx/os1NB1lLZbNmz
X-Received: by 2002:aa7:d785:0:b0:67b:6d1c:9585 with SMTP id
 4fb4d7f45d1cf-68214ba3045mr32613a12.8.1778644255979; Tue, 12 May 2026
 20:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426062718.1238437-1-surenb@google.com> <20260426125941.9921d585e2c5033e68ddb9a1@linux-foundation.org>
In-Reply-To: <20260426125941.9921d585e2c5033e68ddb9a1@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 12 May 2026 20:50:42 -0700
X-Gm-Features: AVHnY4KooogSc_WOOEscskwK_cvUJBgoIv2moaw-0M_9CqRzzIq_0iRE4kQW2m8
Message-ID: <CAJuCfpE6L8ZRQEBUVx7j_qYQQJB+coVPUMPhOyHc3V_mBLF6cg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] use vma locks for proc/pid/{smaps|numa_maps} reads
To: Andrew Morton <akpm@linux-foundation.org>
Cc: liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, david@redhat.com, 
	willy@infradead.org, jannh@google.com, paulmck@kernel.org, pfalcato@suse.de, 
	shuah@kernel.org, hsukrut3@gmail.com, richard.weiyang@gmail.com, 
	reddybalavignesh9979@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 12:59=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Sat, 25 Apr 2026 23:27:15 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Use per-vma locks when reading /proc/pid/smaps and /proc/pid/numa_maps
> > similar to /proc/pid/maps to reduce contention on central mmap_lock.
>
> Was the benefit measured/measurable?
>
> Sashiko doesn't like your strchr():
>         https://sashiko.dev/#/patchset/20260426062718.1238437-1-surenb@go=
ogle.com

Sorry, missed your comment earlier.

I think strchr() is fine here and Sashiko did notice that read_page()
always makes sure the buffer ends with a newline character, IOW
*end_pos =3D=3D '\n'. So, once we found this last newline and moved past
it, we terminate the loop. I guess Sashiko is being overprotective...
