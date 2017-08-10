extends Node

const big_dict = {
    "floor-grass-flower_grass": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-grass-grass": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-grass-tall_grass": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-borders-down": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-borders-left": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-borders-right": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-borders-up": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-in_corners-down": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-in_corners-left": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-in_corners-right": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-in_corners-up": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-out_corner-down": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-out_corner-left": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-out_corner-right": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-out_corner-up": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "floor-water-water": {
        "layer": 0,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-attacking": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -26.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-defending": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -24.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-dying": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -24.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-dying2": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-falling": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -18.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-sliding": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -15.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-archer-walking": {
        "layer": 2,
        "offset": {
            "x": -1.0,
            "y": -23.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-attacking": {
        "layer": 2,
        "offset": {
            "x": 10.0,
            "y": -27.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-attacking2": {
        "layer": 2,
        "offset": {
            "x": 12.0,
            "y": -25.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-defending": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-dying": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-healing": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -24.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-sliding": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -14.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-healer-walking": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -23.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-attacking": {
        "layer": 2,
        "offset": {
            "x": 8.0,
            "y": -23.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-attacking2": {
        "layer": 2,
        "offset": {
            "x": 11.0,
            "y": -25.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-defending": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -22.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-dying": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-sliding": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -16.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-characters-sword_man-walking": {
        "layer": 2,
        "offset": {
            "x": -5.0,
            "y": -22.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-caves-gold": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-caves-silver": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-caves-stone": {
        "layer": 2,
        "offset": {
            "x": 6.0,
            "y": -16.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-houses-double": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -42.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-houses-regular": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-houses-tend": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -19.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-wood-post": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-wood-wall": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-forest-wood-working_place": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -29.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-bronze-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-bronze-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-bronze-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-closed-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-closed-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-closed-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-closed-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-empty-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-empty-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-empty-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-full-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-full-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-full-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -13.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-containers-full-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-1": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": 2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-10": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-11": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-12": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-13": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-14": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-2": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": 3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-3": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": 3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-5": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-6": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-7": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": 2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-8": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": 2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-farming-9": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-gold-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-gold-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-gold-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-silver-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-silver-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-silver-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-stone-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-stone-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-stone-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -7.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-stone-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-wood-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-wood-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-wood-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-resources-wood-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -90.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-10": {
        "layer": 2,
        "offset": {
            "x": -6.0,
            "y": -63.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-11": {
        "layer": 2,
        "offset": {
            "x": 7.0,
            "y": -53.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-12": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -83.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-13": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -105.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-14": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -55.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-15": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -73.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-16": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -89.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-17": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -109.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-18": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -119.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-19": {
        "layer": 2,
        "offset": {
            "x": 36.0,
            "y": -55.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 1.0,
                "y": 0.0
            },
            {
                "x": 1.0,
                "y": -1.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-2": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -92.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-20": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -63.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": 0.0,
                "y": -1.0
            }
        ]
    },
    "human-street-buildings-21": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -64.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-22": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -80.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-23": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -65.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-24": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -58.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-25": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -57.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-26": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -114.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-27": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -121.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-28": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -75.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-3": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -82.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-4": {
        "layer": 2,
        "offset": {
            "x": 33.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            }
        ]
    },
    "human-street-buildings-5": {
        "layer": 2,
        "offset": {
            "x": 40.0,
            "y": -51.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            }
        ]
    },
    "human-street-buildings-6": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -87.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-7": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -85.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-8": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -82.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-buildings-9": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -75.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-castles-1": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -112.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": 0.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": -1.0
            },
            {
                "x": -2.0,
                "y": -2.0
            }
        ]
    },
    "human-street-castles-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -157.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": 0.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": -1.0
            },
            {
                "x": -2.0,
                "y": -2.0
            }
        ]
    },
    "human-street-castles-3": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -159.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": 0.0,
                "y": -1.0
            },
            {
                "x": 0.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -2.0
            },
            {
                "x": -1.0,
                "y": -1.0
            },
            {
                "x": -1.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": 0.0
            },
            {
                "x": -2.0,
                "y": -1.0
            },
            {
                "x": -2.0,
                "y": -2.0
            }
        ]
    },
    "human-street-misc-arrows-1": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-arrows-2": {
        "layer": 2,
        "offset": {
            "x": -5.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-arrows-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-arrows-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-chests-1": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -13.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-chests-2": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-gates-1": {
        "layer": 2,
        "offset": {
            "x": -42.0,
            "y": -83.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-gates-2": {
        "layer": 2,
        "offset": {
            "x": -41.0,
            "y": -82.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-other-fountain": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-other-light_post": {
        "layer": 2,
        "offset": {
            "x": -9.0,
            "y": -30.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-other-magic_tower": {
        "layer": 2,
        "offset": {
            "x": -1.0,
            "y": -78.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-other-portal": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -31.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-other-well": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -13.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-trees-1": {
        "layer": 2,
        "offset": {
            "x": -5.0,
            "y": -78.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-trees-2": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -77.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-trees-apple_tree": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -64.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-walls-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -34.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-walls-2": {
        "layer": 2,
        "offset": {
            "x": -5.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-misc-walls-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-road-down": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-road-left": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-road-right": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-road-road": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-road-up": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-towers-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -70.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-towers-2": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -53.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "human-street-towers-3": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -57.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-buffalo": {
        "layer": 2,
        "offset": {
            "x": -9.0,
            "y": -19.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-croco": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-elephant": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -22.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-giraffe": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -43.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-hypo": {
        "layer": 2,
        "offset": {
            "x": -6.0,
            "y": -14.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-leopard": {
        "layer": 2,
        "offset": {
            "x": -6.0,
            "y": -17.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-lion": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -21.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-rhyno": {
        "layer": 2,
        "offset": {
            "x": -8.0,
            "y": -16.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-animals-zebra": {
        "layer": 2,
        "offset": {
            "x": -5.0,
            "y": -21.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-dispersed-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-dispersed-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-dispersed-3": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-dispersed-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-dispersed-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-floor-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-floor-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-flowers-floor-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-1": {
        "layer": 1,
        "offset": {
            "x": 8.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-10": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -6.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-11": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-2": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-3": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-4": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -14.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-5": {
        "layer": 2,
        "offset": {
            "x": -11.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-6": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-7": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-8": {
        "layer": 1,
        "offset": {
            "x": -7.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-disperse-9": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -20.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-plants-floor-1": {
        "layer": 1,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-1": {
        "layer": 2,
        "offset": {
            "x": 9.0,
            "y": -21.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -27.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -24.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-5": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -13.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-grass-tall-7": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -20.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-multiple_bush-1": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -9.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-multiple_bush-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-multiple_bush-3": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-multiple_bush-4": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-1": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -12.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-10": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -10.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-11": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-12": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-13": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-14": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -6.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-15": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-16": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-17": {
        "layer": 2,
        "offset": {
            "x": 7.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-18": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-19": {
        "layer": 2,
        "offset": {
            "x": 6.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -25.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-20": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -5.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-5": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -6.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-6": {
        "layer": 2,
        "offset": {
            "x": -3.0,
            "y": -4.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-7": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -4.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-8": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-bushes-single_bush-9": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-1": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -37.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-2": {
        "layer": 2,
        "offset": {
            "x": 9.0,
            "y": -41.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-3": {
        "layer": 2,
        "offset": {
            "x": -9.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-4": {
        "layer": 2,
        "offset": {
            "x": 9.0,
            "y": -47.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-5": {
        "layer": 2,
        "offset": {
            "x": -9.0,
            "y": -21.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-6": {
        "layer": 2,
        "offset": {
            "x": -44.0,
            "y": -60.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            },
            {
                "x": -1.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-carnivour-7": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -19.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-1": {
        "layer": 2,
        "offset": {
            "x": 6.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-2": {
        "layer": 2,
        "offset": {
            "x": 1.0,
            "y": -44.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-3": {
        "layer": 2,
        "offset": {
            "x": -20.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-4": {
        "layer": 2,
        "offset": {
            "x": -19.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-5": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -34.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-6": {
        "layer": 2,
        "offset": {
            "x": 8.0,
            "y": -24.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-palm-7": {
        "layer": 2,
        "offset": {
            "x": 8.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-pink-1": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -29.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-pink-2": {
        "layer": 2,
        "offset": {
            "x": 11.0,
            "y": -21.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-pink-3": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -39.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-plants-spiral": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-bronze-1": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-bronze-2": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-bronze-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -4.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-gold-1": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-gold-2": {
        "layer": 2,
        "offset": {
            "x": 2.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-gold-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-silver-1": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-silver-2": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-silver-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-1": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": 0.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -3.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-4": {
        "layer": 2,
        "offset": {
            "x": -4.0,
            "y": -2.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -8.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-7": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -4.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-8": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -6.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-resources-stone-9": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -11.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-flower_trees-1": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -30.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-flower_trees-2": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -31.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-flower_trees-3": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -29.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-flower_trees-4": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -27.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-1": {
        "layer": 2,
        "offset": {
            "x": -11.0,
            "y": -44.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-10": {
        "layer": 2,
        "offset": {
            "x": 31.0,
            "y": -42.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-2": {
        "layer": 2,
        "offset": {
            "x": -21.0,
            "y": -33.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-3": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -43.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-4": {
        "layer": 2,
        "offset": {
            "x": 5.0,
            "y": -42.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -27.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-6": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -41.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-7": {
        "layer": 2,
        "offset": {
            "x": 28.0,
            "y": -43.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-8": {
        "layer": 2,
        "offset": {
            "x": -16.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-palm_trees-9": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -34.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -45.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -45.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -44.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -42.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -43.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-pine_trees-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -44.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type1-1": {
        "layer": 2,
        "offset": {
            "x": 20.0,
            "y": -51.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type1-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -53.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type1-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -54.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type1-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -54.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-1": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -37.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-2": {
        "layer": 2,
        "offset": {
            "x": 4.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-3": {
        "layer": 2,
        "offset": {
            "x": 6.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -37.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-5": {
        "layer": 2,
        "offset": {
            "x": 3.0,
            "y": -38.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type2-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -35.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-1": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-2": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-3": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-4": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-5": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type3-6": {
        "layer": 2,
        "offset": {
            "x": -7.0,
            "y": -36.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-10": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-11": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-12": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-13": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-14": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-15": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-16": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-17": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-18": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-7": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-8": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type4-9": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -28.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type5-1": {
        "layer": 2,
        "offset": {
            "x": -2.0,
            "y": -37.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type5-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type5-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type5-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-1": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-10": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-11": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-12": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-13": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-2": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-3": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-4": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-5": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-6": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-7": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-8": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    },
    "nature-trees-type6-9": {
        "layer": 2,
        "offset": {
            "x": 0.0,
            "y": -40.0
        },
        "used_cells": [
            {
                "x": 0.0,
                "y": 0.0
            }
        ]
    }
}