From: keescook at chromium.org (Kees Cook)
Date: Mon, 28 Jan 2019 20:58:36 +1300
Subject: [PATCH] selftests/seccomp: Actually sleep for 1/10th second
In-Reply-To: <CAKwvOdkvV+1qVUTz7G+nfftdzUfTGL+RnQ_8rA_RAhRrpvRLBA@mail.gmail.com>
References: <20190127094357.GA9436@beast>
 <CAKwvOdnUzTXSBPayebsy8pJGjJjPS3oi3qE8nRPtAhtv_PJ4xw@mail.gmail.com>
 <CAGXu5jKDdutht_+hVhKan6cNZ+bS7e0gom5yXmcMgKE9KuZwYg@mail.gmail.com>
 <CAKwvOdkvV+1qVUTz7G+nfftdzUfTGL+RnQ_8rA_RAhRrpvRLBA@mail.gmail.com>
Message-ID: <CAGXu5jL8GHE3XLLo36Ldej3Z6ZHg+kN5Jfq-Pepvu3hzNsf52A@mail.gmail.com>

On Mon, Jan 28, 2019 at 8:37 AM Nick Desaulniers
<ndesaulniers at google.com> wrote:
> So this test has been broken? If so, do you know for how long? Or
> who's monitoring them?  Either way, thanks for noticing and fixing.

No, it's been working fine. It just consumes 100% cpu during the
spin-wait. The intention was to sleep for a little bit to avoid a
tight loop. It was just resource-inefficient.

-- 
Kees Cook
