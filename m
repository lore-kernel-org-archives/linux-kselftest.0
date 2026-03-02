Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318DF20E702
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 00:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772412666; cv=pass; b=LS2LfmK4dSf+lBAIjuxzWMP9NU9FoSGYkso+P3cFfVcoYHnTPOL24yq2mg+FMWCvAgk1wEpK10AsLyh1W9xl0HowNm77WtSojI37M8SoHQ2/2yGUW6VIa817Tdsx9RpzkJFJ1Az8nt6BP9p6xwbFhOaNYOhSzQy3jURYnHdcgYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772412666; c=relaxed/simple;
	bh=qvZaJJMS2vz6p/aGa4RobNUGUBVNajyarp4Lzd2o2Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMQ7ChKNarJcUQhgjmK15QLqUZkqxu5GCtz3SDZZ0tTV+7KCaPhKN//ZyVfi946NgUobiDowV4I0X3JR9G+dRelY/OU/d1dvAxIRzSX3pRxiDpcJHbuNYTyV1BPAnDBPgkRT5sIPgCYAjC/ttRlnwlcMiOfyxywdcXNBzX80yZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgjegBc0; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgjegBc0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9381e78a31so355860866b.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 16:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772412663; cv=none;
        d=google.com; s=arc-20240605;
        b=S4J23EMZXd5HuNXMx/sw2xAocc9BiHFc1eiUc020hXcq3P/8xkBM0olDwJLh8CRZHg
         TVCGxubL9RJhrDy2i/4YDRMQ05aqKUajhhbZqC7Rz/RxiPYoWo9uzsQ3t7+vi+1Fd01V
         t0iBCwuXyxbZ3VDBzJmToM72SGYbt9yQXJ3T4Nad1xnvelHUT77rZIW2eOoKtxfV9Vct
         R3349DNwzY06ZBJENtEH5HNmq1foRQf0n6eKTv4LWvYMXEz39MEJCKmlmaAGxH6TY7Y2
         BvCVScbxJn4wCHTE61YrkY32KXlFOTreKIfOWwTaPserraLTPen6DQix7ewGW9KMTIMS
         AA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+jJGS+XOzy/gggmJbCMxCjpOngCW2GiNWeRfw+dwHvg=;
        fh=w8BQPeCb8z0jjhgG8CFFx+szsA5plX5PV3r8O6op2jc=;
        b=TZT8aypgrXlLbjn/4yn1OSW8wFTteMwAovSJTsuERVrpTjuK7+CU73BzSutJ3hYaUc
         StF2d2tR/468KC60via8TkVQL0dvZH3H7SYYRHTEx6fBBxentlCxAUpJF0PbKX2VgU0D
         uZnGicxhmFA8wmLmsx6ISenf/bl1mM+Wz13A1uyKMZ0beeuzLokl+KpYKsO7I61mq2yK
         jDXHvGuDbmo+ckfDFUDo4px2g84xqog7RCTBnm/67HuBtapdeviLjiXo3Uwz82ZK91Ul
         rAQKmcnuieDhFG3CHdJp8Z5eOIfvIuRW6KlEQuuoWqSmjkg9ZOq8PHaE8ffz7qvgV2WH
         Vtiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772412663; x=1773017463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jJGS+XOzy/gggmJbCMxCjpOngCW2GiNWeRfw+dwHvg=;
        b=VgjegBc0o/8cI0qUeyuublyHTQ3kDOTjQjwWWZFOW8hyBToEA1frh6HbDbz6+7LYLd
         /wfvl4PVd6rbikSUPj+lDuNwHl0BxMBpGXPV+uZCcz6IwO4wLn6J6LDMcR8MJCTAjMcO
         yW+G3tVtwd/IwgSgBUKMtDvCn2ccCL15XE0jUqY0Xm6BHDaYt5R02D6ADuZvKNRnVPYU
         s7SeuxfvRsdG0J87RirnozjrwEXzyCrbtuA2jz/6iQIKJvPXrqWFivkeip/+3TTFfC+l
         utEoe5O95hCxoHDlv/Rh/r1pPnPVqjONPAELK4xN3EZNj1ZqcPLuDA/LWfAnBJyYnXGT
         rLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772412663; x=1773017463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jJGS+XOzy/gggmJbCMxCjpOngCW2GiNWeRfw+dwHvg=;
        b=kW3FeyRl91CVLMEKfwrTKTLHdK5Bpp1DAzwdw4Jhd8dJgH1LEB82PIMDwp12PXHwNa
         nXtQ3DZpSuTWcsnyer32C9eB04X2/MDXrKNiD23/fafygl6sLLaPsjjupHf3y/7bPHnq
         SFcc8ONe+a3X9fyLAjGvISAJ2erjWtFhbOEFh8NCkFeL2RXjZ6SBxbHWRQcUAVVS7Mek
         CdASXKwiPutu1zZAM7pSMmXYREvGZ4RiUJ8uTOKuDiLS37/5H9cfpptEgf40CIprRanB
         BWKgliawOSubWAFh5AuJh/yNxbHttbBkLQQgxj9CiRMNuGHN3w2z1R86GSolnlTe2rt8
         Beqg==
X-Forwarded-Encrypted: i=1; AJvYcCX7ADNn750SmTkhGr8aOzDEwsLIyCjGweXPKolZePseAEOrEkQssRqjg+97Q5MPEzdqeA069fgMvHH3OKO5wfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvT8HUo3ZHaFBRyEz4HviLkWqw3jk50ZLQMC9QvRbGzNz3ds0k
	nM3CTJmxnU61M9qPuN0WFExByhjFUk3+CORpkm4M4pGQx8Xwg7LrXJa+GVKImIpqHr8PGGrNBnz
	/QgrqRml09ZD/bKKSZAvMK/Ig/IYrYV0=
X-Gm-Gg: ATEYQzxN49cDdAGWa1V07xOSsMD97GFKGKYPBJ4qowgll5XyRhxyId8d0wExCbQo8NR
	BHQ3Nc0IwBhPfIJ3i7JvWq0bNyO15M1nywxnXrb2Zc0tuw+m2a80ctGv4kgCGoTw37fc7M1m3zu
	Jv377VqC57CZw3zqarc5jAQLMenJwMCyFsoJjEZ0NARtM4DDDlEML+AEu58fRr8sSs519ODon/1
	ZtN1sYmmWs4rwHpOW41gFpPpVrWwv/OxNdeQuoxrylarap93Tt6Yi4eMVaupjbLC2VEhSj9j9mp
	QZiHbw==
X-Received: by 2002:a17:907:da9:b0:b93:8460:4a3 with SMTP id
 a640c23a62f3a-b9384600779mr607201366b.56.1772412663230; Sun, 01 Mar 2026
 16:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301011131.4057-1-teknoraver@meta.com> <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
 <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com> <b7d028a084ddda66058504aab72032cb9beaf771.camel@perches.com>
In-Reply-To: <b7d028a084ddda66058504aab72032cb9beaf771.camel@perches.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Mon, 2 Mar 2026 01:50:26 +0100
X-Gm-Features: AaiRm517QXoJZEqCX9i-RMkKIalKbfJKCdo6W_Fylyt9GYX9fBza6M3AzK5yuUE
Message-ID: <CAFnufp3ufMfv8BYLNSqJWoybRMcw5FeuFThp-mRBTU9sYUb=WQ@mail.gmail.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test files
To: Joe Perches <joe@perches.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno dom 1 mar 2026 alle ore 17:42 Joe Perches <joe@perches.com>
ha scritto:
>
> On Sun, 2026-03-01 at 12:17 +0100, Matteo Croce wrote:
> > BTW at this point it would be useful to implement the ** glob operator,
> > but maybe it's not worth it.
>
> Hi Matteo.
>
> Given you've now touched get_maintainer, you are welcome to do it.
> Maybe change "sub file_match_pattern {".
> But I believe this is the first actual use case so I will not.

Mmm not really the first usage, I see this pattern being already used:

$ grep -F '/*/*/' MAINTAINERS
F: Documentation/devicetree/bindings/*/*/*ma35*
F: drivers/*/*/*ma35*
F: Documentation/devicetree/bindings/*/*/*npcm*
F: drivers/*/*/*npcm*
F: arch/*/*/*/*ftrace*
F: arch/*/*/*ftrace*
F: drivers/net/ethernet/*/*/*/*/*xdp*
F: drivers/net/ethernet/*/*/*xdp*

I tried to implement it and seems easier than expected, the chunk below does it
(validated with: scripts/get_maintainer.pl --self-test=patterns)

--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -375,7 +375,9 @@ sub read_maintainer_file {
      ##Filename pattern matching
      if ($type eq "F" || $type eq "X") {
  $value =~ s@\.@\\\.@g;       ##Convert . to \.
- $value =~ s/\*/\.\*/g;       ##Convert * to .*
+ $value =~ s/\*\*/\x00/g;     ##Convert ** to placeholder
+ $value =~ s/\*/[^\/]*/g;     ##Convert * to [^/]*
+ $value =~ s/\x00/.*/g;       ##Convert placeholder to .*
  $value =~ s/\?/\./g;         ##Convert ? to .
  ##if pattern is a directory and it lacks a trailing slash, add one
  if ((-d $value)) {
@@ -919,6 +921,8 @@ sub get_maintainers {
  if ($type eq 'F') {
      if (file_match_pattern($file, $value)) {
  my $value_pd = ($value =~ tr@/@@);
+ ## Discount slashes inside [^/] character classes
+ $value_pd -= (() = $value =~ /\[\^\/\]/g);
  my $file_pd = ($file  =~ tr@/@@);
  $value_pd++ if (substr($value,-1,1) ne "/");
  $value_pd = -1 if ($value =~ /^\.\*/);
@@ -955,7 +959,8 @@ sub get_maintainers {
  $line =~ s/([^\\])\.([^\*])/$1\?$2/g;
  $line =~ s/([^\\])\.$/$1\?/g; ##Convert . back to ?
  $line =~ s/\\\./\./g;        ##Convert \. to .
- $line =~ s/\.\*/\*/g;        ##Convert .* to *
+ $line =~ s/\[\^\/\]\*/\*/g; ##Convert [^/]* to *
+ $line =~ s/\.\*/\*\*/g;      ##Convert .* to **
      }
      my $count = $line =~ s/^([A-Z]):/$1:\t/g;
      if ($letters eq "" || (!$count || $letters =~ /$1/i)) {
@@ -1045,12 +1050,8 @@ sub file_match_pattern {
      return 1;
  }
     } else {
- if ($file =~ m@^$pattern@) {
-     my $s1 = ($file =~ tr@/@@);
-     my $s2 = ($pattern =~ tr@/@@);
-     if ($s1 == $s2) {
- return 1;
-     }
+ if ($file =~ m@^$pattern$@) {
+     return 1;
  }
     }
     return 0;

Regards,
-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
