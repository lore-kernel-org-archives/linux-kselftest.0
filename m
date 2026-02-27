Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE4346E7F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184187; cv=none; b=UJPjFGb0BtVWYtXlual77nZPT3aXwqLBAC3+S16dZO70eu6gBpq3CydKJHBAKamTM2wHggMii60+HYvIBvKcs4g5PwRacJnhEvtvfyBFOkfZ4nztEZopmriY+N9oUSgQPcjVeSfBfZcmTF1OKA7WVlUVJ9DnBAlY+9cO4aDvdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184187; c=relaxed/simple;
	bh=bzZmZo8Gs9aXMPQZrUaoUlWMHebUk2KOrySZaq2hYVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYRfHAr+MNbqlyAm67xkrmpg1HRZpawPIG5sTkYvHgGn8dtLo6DEyp+X8SPjRezaeVFkYNVE8LzPGEVvnTiU4ldU5vfS+mrViFufCMKVudMqOmp6TQV9jMgsM78XDochBas6lmuwTWfdZgCwojVRPkBq+XDpaLy/aAH1b3xQIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR6A1fIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR6A1fIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5032C116C6
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772184186;
	bh=bzZmZo8Gs9aXMPQZrUaoUlWMHebUk2KOrySZaq2hYVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NR6A1fImsgZo2g+0F/+HKWlJFqu7AEJ7jPZ3qi1DSr/hP2aA3PrmjELXSKMJnKulu
	 dacC6Lq2chua6ttdZMam3Y0DYML445lgylRNp91OYm5yGRI0OqlCY9VDDkkpmTWDND
	 qGc9u13tfVLoMSHeSWgM6FSC9/bnvLYvS7CIkx0+mwulMWIgs5PYKrR2D1V5TalrIW
	 flEqvTA71r2xya2PIXzJkvAxXLsj+pBOGTpFHJQVTviQsW8arqG9zsSkSXGDpVJ7Ot
	 Qzk3Q+GA9x+FKSuq+B4BGMlwBhaFLYAy+k2lWMy0dTlXyyXaSU/TQKhjDVisIRYCer
	 ZYDoLJ7WXko2g==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794719afcd4so17186397b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 01:23:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXbI0MpOBzr7sUCUusGZ35thlriaqce3XoXCDaZcR+JNSRmfDYFz0Kq1FSexcLhTbi6qutBTdrJJfz5OubuDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHLJS/mSfu+VWHrQmzoJD0G0w/h+3FUB6GjkFnpYm8C6Yxxby
	8lA+iu1uDpNh0+DrVg75TtaY879TdVdRdIH002MTQdqTS3A0gLBP/2iHYyEykMnqXheywU2qhUc
	h0AvlC07agpifZGm1f7SxqzOux4zhL4U=
X-Received: by 2002:a05:690c:6d03:b0:794:f8c1:69c5 with SMTP id
 00721157ae682-798855091b6mr20143507b3.28.1772184186070; Fri, 27 Feb 2026
 01:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org>
In-Reply-To: <20260223061726.82161-1-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 10:22:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmgi1iK6RycwVS-GZFW9591wmcccQSMOFmTsxKY1RuQVQ@mail.gmail.com>
X-Gm-Features: AaiRm53Dm4P8e-GzFuWOPiZ-86ZMRP5wt5fyxINVDq9oAJYPTu5OfQ_r7QiM6rw
Message-ID: <CAD++jLmgi1iK6RycwVS-GZFW9591wmcccQSMOFmTsxKY1RuQVQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 7:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:

> The series is separated from v3 to lessen the burden on the subsequent
> revocable work per suggestion in
> https://lore.kernel.org/all/CAMRc=3DMfQumD1ULx7yU4W2sx=3D35wyQf7-v4tSf44O=
qEu3JDBUAg@mail.gmail.com/.

No matter if revocable goes anywhere or not, this is excellent
maintenance work, thanks Tzung-Bi!

Yours,
Linus Walleij
