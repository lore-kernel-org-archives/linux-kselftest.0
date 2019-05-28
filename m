From: willemdebruijn.kernel at gmail.com (Willem de Bruijn)
Date: Tue, 28 May 2019 13:11:24 -0400
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <CAF=yD-KcX-zCgZFVVVMU7JFy+gJwRpUoViA_mWdM4QtHNr685g@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
 <879E5DA6-3A4F-4CE1-9DA5-480EE30109DE@appneta.com>
 <CAF=yD-LQT7=4vvMwMa96_SFuUd5GywMoae7hGi9n6rQeuhhxuQ@mail.gmail.com>
 <5BB184F2-6C20-416B-B2AF-A678400CFE3E@appneta.com>
 <CAF=yD-+6CRyqL6Fq5y2zpw5nnDitYC7G1c2JAVHZTjyw68DYJg@mail.gmail.com>
 <903DEC70-845B-4C4B-911D-2F203C191C27@appneta.com>
 <CAF=yD-Le0XKCfyDBvHmBRVqkwn1D6ZoG=12gss5T62VcN5+1_w@mail.gmail.com>
 <9811659B-6D5A-4C4F-9CF8-735E9CA6DE4E@appneta.com>
 <CAF=yD-KcX-zCgZFVVVMU7JFy+gJwRpUoViA_mWdM4QtHNr685g@mail.gmail.com>
Message-ID: <CAF=yD-J2eNn4xNu37ekXfDGMtzQjOPVrWJ+EaLqdJmFcrnk8pA@mail.gmail.com>

 > Now that I know the issue is only in TCP, I can speculate that all bytes are
> > being reported, but done with fewer messages. It may warrant some
> > investigation in case there is some kind of bug.
>
> This would definitely still be a bug and should not happen. We have
> quite a bit of experience with TCP zerocopy and I have not run into
> this in practice, so I do think that it is somehow a test artifact.

To be clear, I'm not saying that it is an artifact of your extensions.
It's quite likely that the zerocopy benchmark was a bit flaky in that
regard all along. No need to spend further time on that for this
patchset.
