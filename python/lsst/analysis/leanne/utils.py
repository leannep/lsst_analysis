from __future__ import annotations
import numpy as np

__all__ = ['nanojanskyToABMagnitude']


def nanojanskyToABMagnitude(flux) -> int:
    """ Definition from Oke & Gunn (1983). AB magnitude reference flux in nJy
        (commonly approximated to 3631.0)

    Parameters
    ----------
    flux: `float`
        Flux value in nJy.

    Returns
    -------
    ABMag: `float`
        AB magnitude corresponding to the input flux

    Raises
    ------
    Exception
        Some problem with the conversion (to implement)

    """
    if flux <= 0:
        raise ValueError(
            f"Flux value cannot be negative {flux}"
        )
    referenceFlux = 1e23 * np.power(10, (48.6 / -2.5)) * 1e9
    return -2.5 * np.log10(flux / referenceFlux)
